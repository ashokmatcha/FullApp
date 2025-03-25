namespace Shopping;
using { cuid, managed ,Currency} from '@sap/cds/common';


entity Customers : cuid  {

    name     : Name;
    email    : String(30) @assert.format : '^[\\w.%+-]+@[\\w.-]+\\.[a-zA-Z]{2,}$'; 
    phone    : String(10) @assert.format : '^\\d{10}$';
    address  : String;
    orders   : Composition of many Orders on orders.customer = $self;
}

entity Orders : managed {
    customer   : Association to Customers;  //It will automatically convert current filed _ Association Key field(customer_Id)
    status       : OrderStatus;
    items        : Composition of many OrderItems on items.order = $self;
}

entity OrderItems  {
  
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


