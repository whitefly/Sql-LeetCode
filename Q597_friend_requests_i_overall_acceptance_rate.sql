select ifnull(round((select count(distinct concat(requester_id, '_', accepter_id))
              from request_accepted) / (select count(distinct concat(sender_id, '_', send_to_id))
                                        from friend_request), 2),0.00) as accept_rate
