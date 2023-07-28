clc;
clear;
cla;

global Sphr;
global Link;

create_DH_table();
random_generate_spheres_position_and_radius();
ball_buff=Sphr;

Variable_start_f = [0, 0, 40, 70, 0, -20, 0] ;

%%  ��Ʒ�ռ��׶�
%%��е�۳�ʼ״̬
draw_all(Variable_start_f,0);
view(134,12);
pause;
count = 0;

while size(Sphr, 2) ~= 0
    
    draw_all(Variable_start_f,0);
    sphr = (Sphr(1:3, 1))';    %ȡ��һ����
    
    IK_Variable_start = Variable_start_f;   % ��ֵ����������㣬�п��ܴ�ԭʼ����ҵ��������RRT���޽⣬���Ե���������������о͸����ӵ����
    Variable_target_f = IK_num_solu(IK_Variable_start, sphr);      %����Ŀ���͵�ǰλ������ֵ�⣬�������º��ĩ��λ�÷��ر�����������Ϊ��һ�ε�����
    
    % �ж�����Ƿ��ǿ��е�
    set_variable_in_DH_table(Variable_target_f);
    FK_calculate_joint_matrix_in_world();
%     if ~(feasiblePoint() || count >= 5) 
%         count = count+1;
%         IK_Variable_start(1) = IK_Variable_start(1) + (rand*2-1)*500; 
%         fprintf('��ⲻ���У�������')
%         continue; 
%     end
    [path_f, pathFound] = get_RRT_path_in_joint_space(Variable_start_f, Variable_target_f, 0);
    
    if pathFound
        % ����ſ���
        Variable_start_b = Variable_target_f;
        Variable_target_b = [Variable_target_f(1), 0, 40, 70, 0, -20, 0];
        [path_b, pathFound] = get_RRT_path_in_joint_space(Variable_start_b, Variable_target_b, 0);
            if pathFound
                path_f = trajectory_plan(path_f);
                path_b = trajectory_plan(path_b);
                
                for cont = 1:size(path_f, 1)
                    draw_all(path_f(cont, :), 1);
                end
                
                for cont = 1:size(path_b, 1)      
                    set_variable_in_DH_table(path_b(cont, :));
                    FK_calculate_joint_matrix_in_world();   
                    Sphr(1:3,1) = Link(8).A(1:3, 4);

                    draw_all(path_b(cont, :), 1);
                end
                Sphr(:,1) = [];     %ɾ����һ���򣬵ڶ������Ϊ��һ��
                Variable_start_f = Variable_target_b;    %�����º��ĩ��λ����Ϊ��һ�ε�����
                count = 0;   %������������
            else
                fprintf('�������ʱ�񲻵����ȼ���һ�������������');
                sphr = Sphr(:, 1);
                Sphr(:,1) = [];
                Sphr = [Sphr,sphr];
                count = 0;   %������������
            end      
    else
        fprintf('�������ʱ�񲻵����ȼ���һ�������������');
        sphr = Sphr(:, 1);
        Sphr(:,1) = [];
        Sphr = [Sphr,sphr];
        count = 0;   %������������
    end
end

%%��Ʒ���ý׶�
%����һϵ�еķ��õ�
Position=[
600,600,600,600,400,400,400,400,600,600,600,600,400,400,400,400;     
650,550,450,350,650,550,450,350,650,550,450,350,650,550,450,350;
450,450,450,450,450,450,450,450,250,250,250,250,250,250,250,250
];
time=16;

for i=1:16
   Sphr(4,i)=ball_buff(4,i);
end

while time>0
    draw_all(path_b(size(path_b, 1), :), 0);%ά����һ�ι滮�����״̬
    place= (Position(1:3, time))'; 
    
    IK_Variable_start = Link(8).A(1:3, 4);   % ��ֵ����������㣬�п��ܴ�ԭʼ����ҵ��������RRT���޽⣬���Ե���������������о͸����ӵ����
    Variable_target_f = IK_num_solu(Variable_start_f, place);  %����Ŀ���͵�ǰλ������ֵ�⣬�������º��ĩ��λ�÷��ر�����������Ϊ��һ�ε�����
    place
    % �ж�����Ƿ��ǿ��е�
    set_variable_in_DH_table(Variable_target_f);
    FK_calculate_joint_matrix_in_world();
%     if ~(feasiblePoint() || count >= 5) 
%         count = count+1;
%         IK_Variable_start(1) = IK_Variable_start(1) + (rand*2-1)*500; 
%         fprintf('��ⲻ���У�������')
%         continue; 
%     end  
    [path_f, pathFound] = get_RRT_path_in_joint_space(Variable_start_f, Variable_target_f, 0);
    
    if pathFound
        Variable_start_b   =   Variable_target_f;
        Variable_target_b = [Variable_target_f(1), 0, 40, 70, 0, -20, 0];
        [path_b, pathFound] = get_RRT_path_in_joint_space(Variable_start_b, Variable_target_b, 0);
        if pathFound
                path_f = trajectory_plan(path_f);
                path_b = trajectory_plan(path_b);
           for cont = 1:size(path_f, 1)    
                set_variable_in_DH_table(path_f(cont, :));
                FK_calculate_joint_matrix_in_world();   
                Sphr(1:3,time) = Link(8).A(1:3, 4); %����ĸ��ֲ�������    
                draw_all(path_f(cont, :), 1);
           end
           
           for cont = 1:size(path_b, 1)      
               draw_all(path_b(cont, :), 1);
           end
           
        end
    else
        time=time+1;
    end
  
        time=time-1;

end

draw_all(Variable_start_f,0);
