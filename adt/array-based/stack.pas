program stack;

const
    STACK_ELEMENTS = 18;

type
    TStack = record
        data: array of integer;
        head: integer;
    end;

procedure stack_init(var stack: TStack);
begin
    SetLength(stack.data, STACK_ELEMENTS);
    stack.head := 0;
end;

procedure stack_destroy(var stack: TStack);
begin
    stack_init(stack);
end;

function  stack_size(var stack: TStack): integer;
begin
    stack_size := stack.head;
end;

function  stack_is_full(var stack: TStack): boolean;
begin
    stack_is_full := stack_size(stack) >= STACK_ELEMENTS;
end;

function  stack_is_empty(var stack: TStack): boolean;
begin
    stack_is_empty := stack_size(stack) <= 0;
end;

function  stack_push(var stack: TStack; number: integer): boolean;
begin
    if stack_is_full(stack) then
    begin
        stack_push := false;
        exit;
    end;
    stack.data[stack.head] := number;
    stack.head := stack.head + 1;
    stack_push := true;
end;

function  stack_pop(var stack: TStack; var number: integer): boolean;
begin
    if stack_is_empty(stack) then
    begin
        stack_pop := false;
        exit;
    end;
    stack.head := stack.head - 1;
    number := stack.data[stack.head];
    stack_pop := true;
 end;


var 
    s1, s2: TStack;
    i: integer;
begin
    stack_init(s1);
    stack_init(s2);

    i := 0;
    while stack_push(s1, i) do i := i + 1;
    i := 100;
    while stack_push(s2, i) do i := i + 1;

    writeln('Stack1 size: ', stack_size(s1));
    writeln('Stack2 size: ', stack_size(s2));
   
    write('Stack1: ');
    while stack_pop(s1, i) do write(i, ' ');
    writeln; write('Stack2: ');
    while stack_pop(s2, i) do write(i, ' ');
    writeln;

    stack_destroy(s1);
    stack_destroy(s2);

    writeln('Stack1 size: ', stack_size(s1));
    writeln('Stack2 size: ', stack_size(s2));
end.
