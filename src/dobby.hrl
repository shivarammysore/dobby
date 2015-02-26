% options for all API functions
-record(options, {
    publish = message :: publish_type(),
    traversal = breadth :: search_algorithm(),
    type = user :: identifier_type(),
    max_depth = 0 :: non_neg_integer(),
    loop = identifier :: loop_detection(),
    delta_fun = fun dby_options:delta_default/2 :: delta_fun(),
    delivery_fun = fun dby_options:delivery_default/1 :: delivery_fun()
}).

% database representation of an identifier (vertex)
-record(identifier, {
    id :: dby_identifier(),
    type :: identifier_type(),
    metadata = null :: jsonable(),
    links = #{} :: #{dby_identifier() => jsonable()}
}).

% metadata of a subscription identifier
-type subscription() :: #{
    type => subscription,
    search_fun => search_fun(),
    acc0 => term(),
    start_identifier => dby_identifier(),
    options => #options{},
    last_result => term()
}.

% metadata of a subscription link
-type subscriber() :: #{
    type => subscriber
}.
