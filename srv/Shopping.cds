using { Shopping as Shop  } from '../db/Shopping';


service ShoppingServices  @(requires: 'authenticated-user'){
//@odata.draft.enabled 
    entity Customers  @(restrict: [
    { grant: ['READ'], to: 'admin' }
  ]) as select from Shop.Customers;
    entity Orders as select from Shop.Orders;
    entity OrderItems as select from Shop.OrderItems;

    

}
