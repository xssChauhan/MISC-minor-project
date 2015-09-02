% Type 1 is: Just Display Line
% Type 2 is: Wait for input prompt
% Type 3 is: Perform an function
% Type 4 is: Display without pausing

%Contains a list of functions
% 1. YamlParseAndPlay for YAML Parsing and Lesson Playing
% 2. ObjectType(number) : To run a function based on object type
% 3. CheckObjectType: To check and call relevant ObjectType function
%Cleanup names of functions

%Can add assert() functions at the beginning of each function
% Ex: assert(isfloat(train_x), 'train_x must be a float');
% assert(nargin == 4 || nargin == 6,'number ofinput arguments must be 4 or 6')


%Add more comments to better explain the functions and classes
classdef ExecuteLessonFromYAML
    methods 
        function obj = ExecuteLessonFromYAML(YamlStruct, YamlStructNames)
            for i = 1:length(YamlStructNames)
                Task = LessonContent(YamlStruct.(YamlStructNames(i,:)).id,YamlStruct.(YamlStructNames(i,:)).content,YamlStruct.(YamlStructNames(i,:)).type);
                obj.CheckObjectType(Task);
            end
            pause off;
            
        end
       function ObjectType1(~,LessonContentobj)
           disp(LessonContentobj.content);
                pause;
       end
       function ObjectType2(~,LessonContentobj)
           prompt = LessonContentobj.content;
                x = input(prompt);
                if(x==3.14285)
                    fprintf('Correct!\n');
                    else
                    disp('Incorrect. The correct answer is 3.14285');
                end
                %Correct this to make it general after YAML integration
       end
       function ObjectType3(~,LessonContentobj)
           fprintf('%f...\n',LessonContentobj.content);
                pause;
       end
       function ObjectType4(~,LessonContentobj)
            disp(LessonContentobj.content);
       end
      function  CheckObjectType(obj,LessonContentobj)
             
            switch LessonContentobj.type
                    case 1
                        obj.ObjectType1(LessonContentobj);
                    case 2
                        obj.ObjectType2(LessonContentobj);
                    case 3
                        obj.ObjectType3(LessonContentobj);
                    case 4
                        obj.ObjectType4(LessonContentobj);
            end
             %Add error handling for different object type
          
      end
    end
end
          
