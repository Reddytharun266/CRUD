var request;  

function send_information()  
{  
    var value = document.item_details.item_ID_search.value;  
    var url = "165.22.14.77:8080/TharunReddy/crud.jsp?val=" + value;     
    if(window.XMLHttpRequest){  
    request = new XMLHttpRequest();  
    }  
    else 
    if(window.ActiveXObject)
    {  
        request = new ActiveXObject("Microsoft.XMLHTTP");  
    }  
    try  
    {  
        request.onreadystatechange = get_information;  
        request.open("GET",url,true);  
        request.send();  
    }  
    catch(e)  
    {  
        alert("Unable to connect to server");  
    }  
}  

function send_edit_information() 
{
    var value = document.update_form.item_ID_search.value;  
    var url = "crud.jsp?val=" + value;     
    if(window.XMLHttpRequest){  
    request = new XMLHttpRequest();  
    }  
    else 
    if(window.ActiveXObject)
    {  
        request = new ActiveXObject("Microsoft.XMLHTTP");  
    }  
    try  
    {  
        request.onreadystatechange = get_information;  
        request.open("GET",url,true);  
        request.send();  
    }  
    catch(e)  
    {  
        alert("Unable to connect to server");  
    } 
}
  
function get_information()
{  
    if(request.readyState == 4)
    {  
        var requested_value = request.responseText;  
        document.getElementById('display').innerHTML = requested_value;  
    }  
}
  
function get_information_form()
{  
    if(request.readyState == 4)
    {  
        var requested_value = request.responseText;  
        document.getElementById('form_display').innerHTML = requested_value;  
    }  
}

function save_data_in_table() 
{
    var item_ID = document.item_details.item_ID.value;  
    var item_name = document.item_details.item_name.value;  
    var unit_price = document.item_details.unit_price.value;  
    var stock_quantity = document.item_details.stock_quantity.value;  
    var supplier_ID = document.item_details.supplier_ID.value;  
    var url = "crud_insert.jsp?item_ID=" + item_ID + "&item_name=" + item_name + "&unit_price=" + unit_price + "&stock_quantity=" + stock_quantity + "&supplier_ID=" + supplier_ID;
		     
    if(window.XMLHttpRequest)
    {  
        request = new XMLHttpRequest();  
    }  
    else 
    if(window.ActiveXObject)
    {  
        request = new ActiveXObject("Microsoft.XMLHTTP");  
    }
    request.open("GET", url, true);
    request.send();
    reset();
    refresh("1");
} 

function add_item() 
{
    var item_ID = document.update_form.item_ID.value;  
    var item_name = document.update_form.item_name.value;  
    var unit_price = document.update_form.unit_price.value;  
    var stock_quantity = document.update_form.stock_quantity.value;  
    var supplier_ID = document.update_form.supplier_ID.value;  
    var url = "crud_insert.jsp?item_ID=" + item_ID + "&item_name=" + item_name + "&unit_price=" + unit_price + "&stock_quantity=" + stock_quantity + "&supplier_ID=" + supplier_ID;
             
    if(window.XMLHttpRequest)
    {  
        request = new XMLHttpRequest();  
    }  
    else 
    if(window.ActiveXObject)
    {  
        request = new ActiveXObject("Microsoft.XMLHTTP");  
    }
    request.open("GET", url, true);
    request.send();
    reset_edit_form();
    alert("Item added successfully!");
    send_edit_information();
} 

function edit(id)
{
    // document.getElementById("item_ID").value = id;
    var item_ID = id
    var url = "crud_edit.jsp?val=" + item_ID;
    if(window.XMLHttpRequest)
    {  
        request = new XMLHttpRequest();  
    }  
    else 
    if(window.ActiveXObject)
    {  
        request = new ActiveXObject("Microsoft.XMLHTTP");  
    }  
    request.onreadystatechange = get_information_form;  
    request.open("GET",url,true);  
    request.send();	    
} 

function del_item_details(id)
{
    var result = confirm('Click "OK" to delete item!');
    if (result) 
    {
    	var item_ID = id
    	var url = "crud_delete.jsp?val=" + item_ID;
    	if(window.XMLHttpRequest)
        {  
            request = new XMLHttpRequest();  
        }  
        else 
        if(window.ActiveXObject)
        {  
            request = new ActiveXObject("Microsoft.XMLHTTP");  
        }  
        request.open("GET",url,true);  
        request.send();
    }
    if(document.update_form.item_ID.value != null)
    {
        alert("deleted");
        send_edit_information();
    }
    else
    {
        refresh("3");
    }
}

function change_data_in_table() 
{
    var item_ID = document.item_details.item_ID.value;  
    var item_name = document.item_details.item_name.value;  
    var unit_price = document.item_details.unit_price.value;  
    var stock_quantity = document.item_details.stock_quantity.value;  
    var supplier_ID = document.item_details.supplier_ID.value;  
    var url = "crud_update.jsp?item_ID=" + item_ID + "&item_name=" + item_name + "&unit_price=" + unit_price + "&stock_quantity=" + stock_quantity + "&supplier_ID=" + supplier_ID;
             
    if(window.XMLHttpRequest)
    {  
        request = new XMLHttpRequest();  
    }  
    else 
    if(window.ActiveXObject)
    {  
        request = new ActiveXObject("Microsoft.XMLHTTP");  
    }
    // request.onreadystatechange = get_information;  
    request.open("GET", url, true);
    request.send()
    reset();
    refresh("2");
}

function reset()
{
    document.item_details.item_ID.value = "";  
    document.item_details.item_name.value = "";  
    document.item_details.unit_price.value = "";  
    document.item_details.stock_quantity.value = "";
}

function reset_edit_form()
{
    document.update_form.item_ID.value = "";  
    document.update_form.item_name.value = "";  
    document.update_form.unit_price.value = "";  
    document.update_form.stock_quantity.value = ""; 
    document.update_form.supplier_ID.value = "SP001"; 
}

function update() 
{
    // alert("Click 'OK' to update item");
    var item_ID = document.update_form.item_ID.value;  
    var item_name = document.update_form.item_name.value;  
    var unit_price = document.update_form.unit_price.value;  
    var stock_quantity = document.update_form.stock_quantity.value;  
    var supplier_ID = document.update_form.supplier_ID.value;  
    var url = "crud_update.jsp?item_ID=" + item_ID + "&item_name=" + item_name + "&unit_price=" + unit_price + "&stock_quantity=" + stock_quantity + "&supplier_ID=" + supplier_ID;
             
    if(window.XMLHttpRequest)
    {  
        request = new XMLHttpRequest();  
    }  
    else 
    if(window.ActiveXObject)
    {  
        request = new ActiveXObject("Microsoft.XMLHTTP");  
    }
    // request.onreadystatechange = get_information;  
    request.open("GET", url, true);
    request.send()
    reset_edit_form();
    alert("Item updated successfully");
    send_edit_information();
}

function refresh(id)
{
    if(id == '1')
        alert("Item added successfully");
    if (id == '2') 
        alert("Item updated successfully");
    if (id == '3')
        alert("Item deleted successfully");
    send_information();

}