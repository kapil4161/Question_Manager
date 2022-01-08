class SubjectsController < ApplicationController

    def index 
        @subjects=Subject.where(username: current_user.username)
    end

    def show 
        @subject=Subject.find(params[:id])
    end

    def new 
        @subject=Subject.new 
    end

    def create 
        @subject=Subject.new(subject_params)
        x=@subject.unattempted
        x=x.to_i
        ans=""
        for p in 1..x do 
            ans=ans.concat(p.to_s)
            ans=ans.concat("/")
        end
        @subject.unattempted=ans
        @subject.attempted="/"
        @subject.solved="/"
        @subject.username=current_user.username
        if @subject.save 
            redirect_to @subject 
        else 
            render :new, status: :unprocessable_entity
        end
    end

    def edit 
        @subject=Subject.find(params[:id])
    end

    def update 

        @subject=Subject.find(params[:id])
        @subject.update(subject_args)
        @subject=Subject.find(params[:id])
        a=@subject.ainput
        b=@subject.sinput 
        c=(@subject.attempted).split("/")
        d=(@subject.unattempted).split("/")
        e=(@subject.solved).split("/")

        att_str=@subject.attempted
        if !a.empty?
            if a.in? d 
                if !(a.in? c)
                    att_str=att_str.concat(a)
                    att_str=att_str.concat("/")
                end
            end
        end

        sol_str=@subject.solved
        if !b.empty?
            if b.in? d or b.in? c
                if !(b.in? e)
                    sol_str=sol_str.concat(b)
                    sol_str=sol_str.concat("/")
                end
            end
        end

        uatt_str=""
        for p in d 
            if p.eql?(a) or p.eql?(b)
                next
            end
                uatt_str=uatt_str.concat(p)
                uatt_str=uatt_str.concat("/")
        end

        new_c = att_str.split("/")
        new_c= new_c - e
        a_str=""
        for x in new_c 
            a_str=a_str.concat(x)
            a_str=a_str.concat("/")    
        end
        @subject.unattempted=uatt_str 
        @subject.attempted=a_str
        @subject.solved=sol_str
        @subject.ainput=""
        @subject.sinput=""
        if @subject.update(subject_args)
            redirect_to @subject
        else 
            render :edit, status: :unprocessable_entity 
        end
    end

    def destroy 
        @subject=Subject.find(params[:id])
        @subject.destroy 

        redirect_to '/index'
    end

    private 
        def subject_params 
            params.require(:subject).permit(:subject_name,:unattempted)
        end
        
        def subject_args 
            params.require(:subject).permit(:subject_name, :unattempted, :attempted, :solved, :ainput, :sinput)
        end
end
