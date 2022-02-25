using cld200.caseStudy as db from '../db/schema';

// Order Service
@path: '/order'
service OrderService  {
    entity Order as projection on db.Order;
    entity OrderItem as projection on db.OrderItem;
    entity Vendor as projection on db.Vendor;
    entity Delivery as projection on db.Delivery;
}