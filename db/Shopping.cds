namespace Shopping;
using { cuid, managed ,Currency,Country} from '@sap/cds/common';


entity Customers : cuid  {

    name     : Name  @title: 'Name';
    email    : String(30) @title : 'Email' @assert.format : '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'; 
    phone    : String(10) @title : 'Mobile No';
    address  : String  @title : 'Address';
    Country : Country @title : 'Nation';
   orders   : Composition of many Orders on orders.customer = $self;
}

entity Orders : cuid, managed {
    customer   : Association to Customers;  //It will automatically convert current filed _ Association Key field(customer_Id)
    status       : OrderStatus;
    items        : Composition of many OrderItems on items.order = $self;
}

entity OrderItems :cuid  {
  
    order      : Association to Orders;
    product    : String(100);
    quantity   : Integer ;

     price      : Currency;
}

type Name : String(50);

type OrderStatus : String enum {
    Pending;
    Shipped;
    Delivered;
    Canceled;
};


