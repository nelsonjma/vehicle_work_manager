function insertRowAfter(tableId, content) {
    var tbody = document.getElementById(tableId);
    var rows = tbody.getElementsByTagName("tr");

    if (rows.length != 0) {
        $('#' + tableId + '').find('tr:first').before(content);
    } else {
        $('#' + tableId + '').append(content);
    }
}