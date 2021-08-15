clc;
clear all;
close all;

% Get a list of all files and folders in this folder.
files = dir('Data/')
% Get a logical vector that tells which is a directory.
dirFlags = [files.isdir]
% Extract only those that are directories.
subFolders = files(dirFlags);
% Print folder names to command window.
subFolders(1:3) = [];
% for k = 1 : length(subFolders)
%   fprintf('Sub folder #%d = %s\n', k, subFolders(k).name);
% end
SNR_mm = zeros(1,length(subFolders));
PL_mm = zeros(1,length(subFolders));
RSS_mm = zeros(1,length(subFolders));


for i = 1: length(subFolders)
    filename = strcat('Data/',subFolders(i).name,'/normalized_results.csv');
    M = readmatrix(filename);
    SNR_mm(i) = M(14);
    RSS_mm(i) = M(21);
    PL_mm(i) = M(22);
end


 t_mm = 1:100;
 
 save mmWave.mat SNR_mm RSS_mm PL_mm t_mm