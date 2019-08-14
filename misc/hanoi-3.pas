program hanoi3;

type
    States = ( Prepare, Ready, Remove ); 

    PTask = ^TTask;
    TTask = record
        qnt: integer;
        src: integer;
        dst: integer;
        state: States;
        next: PTask;
    end;

    TTower = record
        head: PTask;
        qnt: integer;
    end;

procedure hanoi_init(var tower: TTower; quantity: integer); forward;
procedure hanoi_solve(var tower: TTower); forward;

procedure hanoi_init(var tower: TTower; quantity: integer);
begin
    tower.qnt := quantity;
    new(tower.head);
    tower.head^.qnt := quantity;    
    tower.head^.src := 1;    
    tower.head^.dst := 3;    
    tower.head^.state := Prepare;
    tower.head^.next := nil;
end;

procedure hanoi_solve(var tower: TTower);
var
    tmp: PTask;
begin
    while tower.head <> nil do
    begin
        case tower.head^.state of
            Prepare:
                begin
                    tower.head^.state := Ready;
                    if tower.head^.qnt > 1 then
                    begin
                        new(tmp);
                        tmp^.qnt := tower.head^.qnt - 1;
                        tmp^.src := tower.head^.src;
                        tmp^.dst := 6 - tower.head^.src - tower.head^.dst;
                        tmp^.state := Prepare;
                        tmp^.next := tower.head;
                        tower.head := tmp;
                    end;
                end;
            Ready:
                begin
                    tower.head^.state := Remove;
                    writeln('N', tower.head^.qnt, ': ', tower.head^.src, ' -> ', tower.head^.dst);
                    if tower.head^.qnt > 1 then
                    begin
                        new(tmp);                                               
                        tmp^.qnt := tower.head^.qnt - 1;                        
                        tmp^.src := 6 - tower.head^.src - tower.head^.dst;
                        tmp^.dst := tower.head^.dst;      
                        tmp^.state := Prepare;                                  
                        tmp^.next := tower.head;                                
                        tower.head := tmp;                        
                    end;
                
                end;
            Remove:
                begin
                    tmp := tower.head^.next;
                    dispose(tower.head);
                    tower.head := tmp;
                end;
        end;
    end;
end;


var
    tower: TTower;

begin
    writeln('The Tower of Hanoi: 3');
    hanoi_init(tower, 3);
    hanoi_solve(tower);
    writeln;
    writeln('The Tower of Hanoi: 4');
    hanoi_init(tower, 4);
    hanoi_solve(tower);
end.
