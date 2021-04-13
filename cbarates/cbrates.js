const rp = require('request-promise');
const $ = require('cheerio');
const fs = require('fs');
const fileName = "cbaRates.csv"
let y = 2012;


scrapRates(y)

function scrapRates(y) {
    if (y >= 2015) {
        return
    }

    let url = `https://www.cba.am/EN/SitePages/ExchangeArchive.aspx?FilterDate=${y}-12-31`

    rp(url)
        .then(function (html) {
            //success!
            let tr = $('.gray_td, .gray_td_light', html);
            let strcsv = "";
            
            for (let td of tr) {
                let iso = $($(td).find("td")[0]).text() //[0].text()
                let rate = $($(td).find("td")[1]).text()

                if (!isNaN(parseInt(rate))) {
                    iso = iso.substring(0, 3)
                    console.log(iso, rate, y)
                    
                    strcsv+= `${iso}, ${rate}, ${y} \n`;
                }

            }


            fs.appendFile(fileName, strcsv, function (err) {
                if (err) throw err;
                console.log(strcsv)
                y++
                scrapRates(y)
            });

        })
        .catch(function (err) {
            console.log(err)
            //handle error
        });
}

