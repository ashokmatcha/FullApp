namespace Shopping;
using { cuid, managed } from '@sap/cds/common';

entity Customers : cuid  {

    name     : String(50);
    email    : String(30);
    phone    : String(10);
    address  : String;
    orders   : Composition of many Orders on orders.customer = $self;
}

entity Orders : managed {
    customer   : Association to Customers;  //It will automatically convert current filed _ Association Key field(customer_Id)
    status       : String(20);
    items        : Composition of many OrderItems on items.order = $self;
}

entity OrderItems {
  
    order      : Association to Orders;
    product    : String(100);
    quantity   : Integer ;
    price      : Decimal(10,2);
}


