function [ answer ] = recordParameters()
prompt = {'Give training rate alpha: ', ...
    'Give acceptable error threshold: ', ...
    'Give max epocs: '};
dlg_title = 'Recording';
num_lines = 1;
defaultans = {'.12', ...
    '10^-3', ...
    '10^3'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
end

