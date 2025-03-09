typedef enum bit {GOOD_PARITY, BAD_PARITY} parity_t;
class yapp_packet extends uvm_sequence_item;

rand bit [5:0] lenght;
rand bit [1:0] addr;
rand bit [7:0] payload[];

  bit [7:0] parity;

rand int packet_delay;
rand parity_t parity_type;


constraint payload_size   {lenght == payload.size();}
constraint default_lenght {lenght > 0; lenght < 64;}
constraint pkt_delay {packet_delay >0; packet_delay < 21;}
constraint address_space {addr <3;}
 constraint parity_type_bias {parity_type dist {GOOD_PARITY:=80,BAD_PARITY:=20};}

function new (string name = "yapp_packet");
  super.new(name);
endfunction


`uvm_object_utils_begin(yapp_packet)

  `uvm_field_int( lenght , UVM_ALL_ON+ UVM_DEC );
  `uvm_field_array_int( payload , UVM_ALL_ON);
  `uvm_field_int( parity, UVM_ALL_ON + UVM_BIN);
  `uvm_field_int( addr , UVM_ALL_ON);
  `uvm_field_enum( parity_t, parity_type, UVM_ALL_ON);
  `uvm_field_int(packet_delay, UVM_ALL_ON + UVM_NOCOMPARE);

  //'uvm_field_int( lenght , UVM_ALL_ON);
`uvm_object_utils_end


function bit [7:0] calc_parity();
parity={lenght,addr};
for (int i=0; i<lenght;i++)parity=parity^payload[i];
endfunction;

function void set_parity();
calc_parity();
if(parity_type==GOOD_PARITY)parity=parity;
else                        parity=~parity;
endfunction


function void post_randomize();
set_parity();
endfunction





endclass: yapp_packet

