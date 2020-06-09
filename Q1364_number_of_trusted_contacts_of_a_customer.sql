select invoice_id, temp.customer_name, price, contacts_cnt, trusted_contacts_cnt
from Invoices
         join
     (select Customers.customer_id,
             Customers.customer_name,
             count(Contacts.user_id) as contacts_cnt,
             count(c1.customer_id)   as trusted_contacts_cnt
      from Customers
               left join Contacts on Customers.customer_id = Contacts.user_id
               left join Customers c1 on Contacts.contact_name = c1.customer_name
      group by 1, 2) temp
     on Invoices.user_id = temp.customer_id

