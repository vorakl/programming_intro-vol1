program queue;

type
    PNode = ^TNode;
    TNode = record
        data: integer;
        next: PNode;
    end;

    TQueue = record
        first: PNode;
        last: PNode;
        size: integer;
    end;


procedure queue_init(var queue: TQueue); forward;
procedure queue_destroy(var queue: TQueue); forward;
function  queue_get(var queue: TQueue; var n: integer): boolean; forward;
procedure queue_add(var queue: TQueue; n: integer); forward;
function  queue_is_empty(var queue: TQueue): boolean; forward;
function  queue_size(var queue: TQueue): integer; forward;
function  queue_search(var queue: TQueue; n: integer): boolean; forward;
function  queue_remove(var queue: TQueue; n: integer): boolean; forward;

procedure queue_init(var queue: TQueue);
begin
    queue.first := nil;
    queue.last := nil;
    queue.size := 0;
end;

procedure queue_destroy(var queue: TQueue);
var
    n: integer;
begin
    while queue_get(queue, n) do ;
    queue_init(queue)
end;

procedure queue_add(var queue: TQueue; n: integer);
var
    cur: PNode;
begin
    new(cur);
    cur^.next := nil;
    cur^.data := n;

    if queue_is_empty(queue) then
        queue.first := cur
    else
        queue.last^.next := cur;
    queue.last := cur;
    queue.size := queue.size + 1;
end;

function queue_get(var queue: TQueue; var n: integer): boolean;
var
    cur: PNode;
begin
    if queue_is_empty(queue) then
    begin
        queue_get := false;
        exit;
    end;
   if queue.first = queue.last then
        queue.last := nil;
    cur := queue.first;
    n := cur^.data;
    queue.first := cur^.next;
    dispose(cur);
    queue.size := queue.size - 1;

    queue_get := true;
 end;

function queue_is_empty(var queue: TQueue): boolean;
begin
    queue_is_empty := queue.first = nil;
end;

function queue_size(var queue: TQueue): integer;
begin
    queue_size := queue.size;
end;

function queue_search(var queue: TQueue; n: integer): boolean;
var
    cur: ^PNode;
begin
    cur := @queue.first;
    while cur^ <> nil do
    begin
        if cur^^.data = n then
        begin
            queue_search := true;
            exit;
        end;
        cur := @cur^^.next;
    end;
    queue_search := false;
end;

function queue_remove(var queue: TQueue; n: integer): boolean;
var
    cur: ^PNode;
    tmp: PNode;
begin
    cur := @queue.first;
    while cur^ <> nil do
    begin
        if cur^^.data = n then
        begin
            queue_remove := true;
            tmp := cur^;
            cur^ := cur^^.next;
            dispose(tmp);
            queue.size := queue.size - 1;
            exit;
        end;
        cur := @cur^^.next;
    end;
    queue_remove := false;
end;

var
    q1, q2: TQueue;
    i: integer;

begin
    queue_init(q1);
    queue_init(q2);

    for i:=0 to 9 do
        queue_add(q1, i);
    for i:=99 downto 90 do
        queue_add(q2, i);

    writeln('Queue1 contains 5: ', queue_search(q1, 5));
    writeln('Queue2 contains 111: ', queue_search(q2, 111));
    writeln(queue_search(q2, 99));
    writeln(queue_search(q2, 90));
    writeln(queue_search(q1, 0));
    writeln(queue_search(q1, 9));
    writeln(queue_search(q2, 100));
    writeln(queue_search(q2, 89));
    writeln(queue_search(q1, 10));
    writeln(queue_search(q1, -1));

    writeln('Queue1 just lost 15: ', queue_remove(q1, 15));
    writeln('Queue2 jsut lost 98: ', queue_remove(q2, 98));

    write('Queue1 (', queue_size(q1), '): ');
    while queue_get(q1, i) do 
        write(i, ' ');
    writeln; write('Queue2 (', queue_size(q2), '): ');
    while queue_get(q2, i) do
        write(i, ' ');
    writeln;

    queue_destroy(q1);
    queue_add(q2, 115);

    write('Queue1 (', queue_size(q1), '): ');
    while queue_get(q1, i) do 
        write(i, ' ');
    writeln; 
    write('Queue2 (', queue_size(q2), ')');
    writeln;
    queue_destroy(q2);
    write('Queue2 (', queue_size(q2), ')');
    writeln;
end.

