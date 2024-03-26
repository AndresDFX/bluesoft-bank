function formHidden(id, hidden) {
  if (hidden) {
    document.getElementById(id).style.display = "none";
  } else {
    document.getElementById(id).style.display = "block";
  }
}

function validAmount(element) {
  var amountValue = parseFloat(element.value.replace(/,/g, "."));

  if (!isNaN(amountValue)) {
    element.value = amountValue.toLocaleString("es");
    return true;
  } else {
    return false;
  }
}

function fetchData(url) {
  return fetch(url)
    .then((response) => {
      if (!response.ok) {
        throw new Error("La solicitud ha fallado: " + response.statusText);
      }
      return response.json();
    })
    .catch((error) => {
      console.error("Error durante la fetch:", error);
      throw error;
    });
}
function formatDate(dateString) {
  const options = {
    day: "numeric",
    month: "long",
    hour: "2-digit",
    minute: "2-digit",
  };
  return new Date(dateString).toLocaleDateString("es", options);
}

function fetchAndUpdateTransactions(transactions, selector) {
  transactions = JSON.parse(transactions);
  const tbody = document.querySelector(selector);
  tbody.innerHTML = "";
  transactions.forEach((tr) => {
    const row = `<tr>
                   <td>${formatDate(tr.fields.created_at)}</td>
                   <td>${tr.fields.type}</td>
                   <td>$${parseFloat(tr.fields.value).toLocaleString("es")}</td>
                 </tr>`;
    tbody.innerHTML += row;
  });
}

function updateTransaction() {
  document.getElementById("panelDataTrans").classList.add("fowards");
}

function generatedExtract() {
  document.getElementById("extractReport").style.display = "block";
  fetchData("/get_transactions")
    .then((data) => fetchAndUpdateTransactions(data, "#reports tbody"))
    .catch((error) =>
      console.error("Error durante el procesamiento de transacciones:", error)
    );
}

document.addEventListener("DOMContentLoaded", function () {
  fetchData("/get_transactions")
    .then((data) => fetchAndUpdateTransactions(data, ".table tbody"))
    .catch((error) =>
      console.error("Error durante el procesamiento de transacciones:", error)
    );
});

function printExtract() {
  var contentForPrint = document.getElementById("extractPrint").outerHTML;
  const style = `<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">`;
  var windowPrint = window.open("", "_blank", "height=600,width=800");
  windowPrint.document.write("<html><head><title> Extracto Bancario</ > ");

  windowPrint.document.write(style);
  windowPrint.document.write("</head><body>");
  windowPrint.document.write(contentForPrint);
  windowPrint.document.write("</body></html>");
  windowPrint.document.close();
  windowPrint.focus();

  windowPrint.onload = function () {
    windowPrint.print();
    windowPrint.close();
  };
}

function submitForm(formName, url) {
  const fomrElement = document.getElementById(formName);
  const formData = new FormData(fomrElement);

  console.log(formData);
  fetch(`http://127.0.0.1:8000/${url}`, {
    method: "POST",
    body: formData,
  })
    .then((response) => {
      if (!response.ok) {
        throw new Error("La solicitud ha fallado: " + response.statusText);
      }
      return response.json();
    })
    .then((data) => {
      if (data.status === "success") {
        alert(data.message);
        window.location.reload();
      } else {
        alert(data.message);
      }
    })
    .catch((error) => {
      console.error("Error durante la fetch:", error);
    });
}
