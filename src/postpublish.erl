-module(postpublish).
-export([postpublish_fun/1]).
-include("emqttd.hrl").

postpublish_fun(Msg) ->
    {ok, Mysqlpid} = mysql:start_link([{host, "localhost"},{user, "root"},{password, "woshinibaba"},{database, "mqtt"}]),
    
    Topic = Msg#mqtt_message.topic,
    Payload = Msg#mqtt_message.payload,

    case is_binary(Msg#mqtt_message.msgid) of
    	true -> Msgid = Msg#mqtt_message.msgid;
    	false -> Msgid = <<"undefined">>
    end,

    case is_binary(Msg#mqtt_message.from) of
    	true -> Clientid = Msg#mqtt_message.from;
    	false -> Clientid = term_to_binary(Msg#mqtt_message.from)
    end,

    case is_binary(Msg#mqtt_message.sender) of
    	true -> Sender = Msg#mqtt_message.sender;
    	false -> Sender = <<"undefined">>
    end,    

    ok = mysql:query(Mysqlpid, <<"insert mqtt_message2 value(?,?,?,?,?)">>, [Msgid, Clientid, Sender, Topic, Payload]).	


  

