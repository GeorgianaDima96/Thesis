function cell = read_tables(path_to_file)
%READ_TABLES Summary of this function goes here
%   Detailed explanation goes here
    fileID = fopen(path_to_file,'r');
    cell = {};
    flag = false;
    while true
        A = fgetl(fileID);
        if A == -1, break; end

        % Catch if new header
        if contains(A, "Frequency"), continue; end

        % Create new table
        if contains(A, "------")
            if flag
                cell{end+1} = new_data;
            end
            flag = true;
            new_data = [];
        else
            new_data = [new_data; str2num(A)];
        end
    end
    cell{end+1} = new_data;
end

