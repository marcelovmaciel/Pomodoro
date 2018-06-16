

const study_time = 25*60

const break_times = (15 * 60, 5 * 60)

"function pomodoro_stuff( n_cycles::Integer; cycle_time::Integer = study_time, rest_times::Tuple = break_times)"
function pomodoro_stuff( n_cycles::Integer; cycle_time::Integer = study_time, rest_times::Tuple = break_times)

    times = 0
    long_rest, short_rest = rest_times

    function one_cycle(times)
        @showprogress 1 "Study Time:"  for i in 1:cycle_time
            sleep(1)
        end
    
        @uhlarm @printf("ok dude; %d cycles \n", times+1)
    end

    function break_time(times)
        if times % 4 ==0
            rest_time = long_rest
            println("longer break \n ")
        else
            println("smaller break \n ")
            rest_time = short_rest
        end
        @showprogress 1 "Break Time:"  for i in 1:rest_time
            sleep(1)
        end

        @uhlarm println("end of break \n")
    end

    function responsefrom_me()

    println("Back to work?")
        response = readline(STDIN);

    if response == "yes"
        println("oh yeah \n")
    else
        error("gotta rest too motherfucker")
    end
    
    end

    while times < n_cycles
        one_cycle(times)
        times+=1
        break_time(times)
        responsefrom_me()
    end

    if times == n_cyles
        error("too much coffe, arguably")
    end

end
