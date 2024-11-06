const Paths = {
  clients: "clients",
  checks: "checks"
}

function addOneDay(inputDate) {
  const date = new Date(inputDate);

  date.setDate(date.getDate() + 1);

  const year = date.getFullYear();
  const month = String(date.getMonth() + 1).padStart(2, '0'); // Months are zero-based
  const day = String(date.getDate()).padStart(2, '0');

  return `${year}-${month}-${day}`;
}



function postToServer(json, path) {
  const xhr = new XMLHttpRequest()

  xhr.onload = () => {
    if (xhr.status >= 200 && xhr.status < 300) {
      const response = JSON.parse(xhr.responseText)
      console.log("collector server responce", response)
    }
  }

  xhr.open('POST', `http://localhost:3131/${path}`)

  xhr.setRequestHeader('Content-Type', 'application/json')

  xhr.send(JSON.stringify(json))
}

/* function getClients(pageId = 1) {
  if (pageId > 234) return */
// 234
function getClients(pageId = 233) {
  if (pageId > 267) return

  const qString = `select%5B%5D=client_id&select%5B%5D=fio&select%5B%5D=card_number&select%5B%5D=phone&select%5B%5D=date_activale&select%5B%5D=client_groups_id&select%5B%5D=discount_per&select%5B%5D=client_groups_discount&select%5B%5D=total_payed_sum&select%5B%5D=bonus&select%5B%5D=ewallet_balance&select%5B%5D=birthday&select%5B%5D=client_sex&select%5B%5D=email&select%5B%5D=address&select%5B%5D=city&select%5B%5D=country&select%5B%5D=comment&select%5B%5D=client_transaction_last_date&search=&sort%5Bfield%5D=client_id&sort%5Btype%5D=asc&paginate%5Brows%5D=100&paginate%5Bpage%5D=${pageId}&withFieldsAndLists=false`
  //const qString = `select%5B%5D=fio&select%5B%5D=card_number&select%5B%5D=phone&select%5B%5D=client_groups_id&select%5B%5D=client_groups_discount&select%5B%5D=total_payed_sum&search=&sort%5Bfield%5D=card_number&sort%5Btype%5D=desc&paginate%5Brows%5D=100&paginate%5Bpage%5D=${pageId}&withFieldsAndLists=false`
  const XHR = new XMLHttpRequest();

  const urlEncodedData = qString
  XHR.addEventListener("load", (event) => {
    console.log(`customer page ${pageId}`)
    const dataJSON = JSON.parse(event.target.response)
    postToServer(dataJSON.data, Paths.clients)

    pageId++
    getClients(pageId)
  });

  XHR.addEventListener("error", (event) => {
    console.log(event.error)
  });

  XHR.open("POST", "https://ringo5.joinposter.com/listings/marketing_clients/data");

  XHR.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

  XHR.send(urlEncodedData);
}

/* function getChecks(date = "2022-02-20") {
  if (date === "2023-11-26")
    return
 */

function getChecks(date = "2023-11-26") {
  if (date === "2024-11-26")
    return

  const paginateRows = 5000
  const dateStart = date
  const dateEnd = date
  const qString = `select%5B%5D=transaction_id&select%5B%5D=order_source&select%5B%5D=cash_shift_id&select%5B%5D=courier_id&select%5B%5D=user_id&select%5B%5D=date_start_new&select%5B%5D=date_close&select%5B%5D=opened_seconds&select%5B%5D=preparing_seconds&select%5B%5D=transit_seconds&select%5B%5D=summary_seconds&select%5B%5D=spot_id&select%5B%5D=client_name&select%5B%5D=client_groups_id&select%5B%5D=sum&select%5B%5D=delivery_price&select%5B%5D=delivery_zone_id&select%5B%5D=client_address&select%5B%5D=payed_sum&select%5B%5D=payed_cash&select%5B%5D=payed_card&select%5B%5D=payed_cert&select%5B%5D=payed_ewallet&select%5B%5D=payed_bonus&select%5B%5D=payed_third_party&select%5B%5D=tip_sum&select%5B%5D=round_sum&select%5B%5D=tax_sum&select%5B%5D=discount&select%5B%5D=promotion_ids&select%5B%5D=total_profit&select%5B%5D=total_cost&select%5B%5D=status&select%5B%5D=payed_card_type&select%5B%5D=transaction_comment&select%5B%5D=payment_method_id&filter%5B0%5D%5Bfield%5D=date_close&filter%5B0%5D%5Bcondition%5D=%3C%3D&filter%5B0%5D%5Bvalue%5D=${dateStart}&filter%5B0%5D%5Btype%5D=date_range&filter%5B1%5D%5Bfield%5D=date_close&filter%5B1%5D%5Bcondition%5D=%3E%3D&filter%5B1%5D%5Bvalue%5D=${dateEnd}&filter%5B1%5D%5Btype%5D=date_range&filter%5B1%5D%5BlastInRow%5D=true&search=&sort%5Bfield%5D=transaction_id&sort%5Btype%5D=desc&paginate%5Brows%5D=${paginateRows}&paginate%5Bpage%5D=1&withFieldsAndLists=false`
  //const qString = `select%5B%5D=transaction_id&select%5B%5D=user_id&select%5B%5D=date_start_new&select%5B%5D=date_close&select%5B%5D=payed_sum&select%5B%5D=discount&select%5B%5D=total_profit&select%5B%5D=status&filter%5B0%5D%5Bfield%5D=date_close&filter%5B0%5D%5Bcondition%5D=%3C%3D&filter%5B0%5D%5Bvalue%5D=2023-12-31&filter%5B0%5D%5Btype%5D=date_range&filter%5B1%5D%5Bfield%5D=date_close&filter%5B1%5D%5Bcondition%5D=%3E%3D&filter%5B1%5D%5Bvalue%5D=1970-01-01&filter%5B1%5D%5Btype%5D=date_range&filter%5B1%5D%5BlastInRow%5D=true&search=&sort%5Bfield%5D=transaction_id&sort%5Btype%5D=desc&paginate%5Brows%5D=100&paginate%5Bpage%5D=${pageId}&withFieldsAndLists=false`
  const XHR = new XMLHttpRequest();

  const urlEncodedData = qString
  XHR.addEventListener("load", (event) => {

    const dataJSON = JSON.parse(event.target.response)
    const nextDate = addOneDay(date)

    if (dataJSON.data.length === 0)
      return getChecks(nextDate)

    console.log(`check date ${date}`)
    postToServer(dataJSON.data, Paths.checks)

    getChecks(nextDate)

  });

  XHR.addEventListener("error", (event) => {
    console.log(event.error)
  });

  XHR.open("POST", "https://ringo5.joinposter.com/listings/dash_receipts/data");

  XHR.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

  XHR.send(urlEncodedData);
}
