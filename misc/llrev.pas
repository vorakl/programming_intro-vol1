program llrev;

type
    pnode = ^node;
    node = record
        data : integer;
        next : pnode;
    end;

var 
    i : integer = 0;
    elems : integer = 0;
    ll_first : pnode = nil;
    ll_cur : pnode = nil;
    first : boolean = true;

begin
    write('Enter numbers: ');
    while not seekeof do begin
        read(i);
        new(ll_cur);
        ll_cur^.data := i;
        elems := elems + 1;
        writeln('   ', i, ' added');
        if first then begin
            first := false;
            ll_cur^.next := nil;
        end else begin
            ll_cur^.next := ll_first; 
        end;
        ll_first := ll_cur;
    end;

    writeln('Write a list of ', elems, ' items in a reverse order: ');
    while ll_cur <> nil do begin
        writeln(ll_cur^.data);
        ll_cur := ll_cur^.next;
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
