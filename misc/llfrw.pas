program llfrw;

type
    pnode = ^node;
    node = record
        data : integer;
        next : pnode;
    end;

var 
    i : integer = 0;
    k : integer;
    elems : integer = 0;
    ll_first : pnode = nil;
    ll_last : pnode = nil;
    ll_cur : pnode = nil;
    first : boolean = true;

begin
    write('Enter numbers: ');
    while not seekeof do begin
        read(i);
        new(ll_cur);
        ll_cur^.data := i;
        ll_cur^.next := nil;
        elems := elems + 1;
        writeln('   ', i, ' added');
        if first then begin
            first := false;
            ll_first := ll_cur;
            ll_last := ll_cur;
        end else begin
            ll_last^.next := ll_cur;
            ll_last := ll_cur;
        end;
    end;

    for k := 1 to 2 do begin
        ll_cur := ll_first;
        writeln('Writing a list of ', elems, ' items in a straight order (',k,' iteration): ');
        while ll_cur <> nil do begin
            writeln(ll_cur^.data);
            ll_cur := ll_cur^.next;
        end;
    end;

    while ll_first <> nil do begin
        ll_cur := ll_first;
        ll_first := ll_first^.next;
        writeln('   ', ll_cur^.data, ' removed');
        dispose(ll_cur);
        elems := elems - 1;
    end;

    writeln(elems, ' items left in a list');
end.
