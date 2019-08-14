program queue;

const
    QUEUE_ELEMENTS = 5;

type
    TQueue = record
        data: array of integer;
        head: integer;
        tail: integer;
        size: integer;
    end;

procedure queue_init(var queue: TQueue);
begin
    SetLength(queue.data, QUEUE_ELEMENTS);
    queue.head := 0;
    queue.tail := 0;
    queue.size := 0;
end;

procedure queue_destroy(var queue: TQueue);
begin
    queue_init(queue);
end;

function  queue_size(var queue: TQueue): integer;
begin
    queue_size := queue.size;
end;

function  queue_is_full(var queue: TQueue): boolean;
begin
    queue_is_full := queue_size(queue) >= QUEUE_ELEMENTS;
end;

function  queue_is_empty(var queue: TQueue): boolean;
begin
    queue_is_empty := queue_size(queue) <= 0;
end;

function  queue_add(var queue: TQueue; number: integer): boolean;
begin
    if queue_is_full(queue) then
    begin
        queue_add := false;
        exit;
    end;
    queue.data[queue.head] := number;
    queue.head := queue.head + 1;
    queue.size := queue.size + 1;
    if queue.head >= QUEUE_ELEMENTS then
        queue.head := 0;
    if (queue.head = queue.tail) and (not queue_is_full(queue)) then
    begin
        writeln('Head has catched up Tail but the queue is not full!');
        halt;
    end;
    queue_add := true;
end;

function  queue_get(var queue: TQueue; var number: integer): boolean;
begin
    if queue_is_empty(queue) then
    begin
        queue_get := false;
        exit;
    end;
    number := queue.data[queue.tail];
    queue.tail := queue.tail + 1;
    queue.size := queue.size - 1;
    if queue.tail >= QUEUE_ELEMENTS then
        queue.tail := 0;
    if (queue.tail = queue.head) and (not queue_is_empty(queue)) then
    begin
        writeln('Tail has catched up Head but the queue is not empty!');
        halt;
    end;
    queue_get := true;
end;

procedure queue_debug(var queue: TQueue);
var 
    k: integer;
begin
    writeln('>>> Size: ', queue.size, ' Head: ', queue.head, ' Tail: ', queue.tail);
    write('>>> ');
    for k:=0 to QUEUE_ELEMENTS - 1 do
        write(queue.data[k], ' ');
    writeln;
end;

var 
    q1, q2: TQueue;
    i: integer;
begin
    queue_init(q1);
    queue_init(q2);

    i := 0;
    while queue_add(q1, i) do i := i + 1;
    queue_add(q2, 22);
    queue_add(q2, 23);
    queue_add(q2, 24);
    queue_add(q2, 25);
    queue_get(q2, i); 
    queue_get(q2, i);
    queue_add(q2, 26);
    queue_add(q2, 27);
    queue_add(q2, 28);
    queue_add(q2, 29);
    
    writeln('Queue1 size: ', queue_size(q1));
    queue_debug(q1);
    writeln('Queue2 size: ', queue_size(q2));
    queue_debug(q2);
     
    write('Queue1: ');
    while queue_get(q1, i) do write(i, ' ');
    writeln; write('Queue2: ');
    while queue_get(q2, i) do write(i, ' ');
    writeln;
    
    writeln('Is there anything in q2: ', queue_get(q2, i)); { does nothing, it's empty already }

    writeln('Queue1 size: ', queue_size(q1));
    queue_debug(q1);
    writeln('Queue2 size: ', queue_size(q2));
    queue_debug(q2);

    queue_destroy(q1);
    queue_destroy(q2);
end.
