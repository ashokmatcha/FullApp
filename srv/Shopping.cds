using { Shopping as Shop  } from '../db/Shopping';


service ShoppingServices {

    entity Customers as select from Shop.Customers;
    entity Orders as select from Shop.Orders;
    entity OrderItems as select from Shop.OrderItems;

    

}
