
%loading data file
raw_data=xlsread('AMZN-DUK-KO.xlsx');

%clculating column-wise mean of dataset
mean_vector=mean(raw_data);
%clculating column-wise standard_deviation of dataset
std_vector=std(raw_data);

%clculating dimensioin 
[no_rows,no_col]=size(raw_data);

%subtracting column_values with respective column_mean
mean_diff=raw_data-mean_vector;

%coveriance matrix
coveriance_matrix=(transpose(mean_diff)*mean_diff)./(no_rows-1);
disp('coveriance_matrix');
disp(coveriance_matrix);

%calculation of correlation coefficient matrix of the dataset
mean_dev=(raw_data-mean_vector)./std_vector;
corrcoef_matrix=(transpose(mean_dev)*mean_dev)./(no_rows-1);
disp('correlationcoefficient_matrix');
disp(corrcoef_matrix);

%Principal Component Analysis
%standardizing the dataset
std_dataset=mean_dev;

%covariance matrix of the standard_dataset
cov_std_dataset=cov(std_dataset);

%calculating the eigen values and eigen vectors
%of the covariance matrix
[vec,val]=eig(cov_std_dataset);

%eigen vector
disp('Eigen vectors');
disp(vec);
%eigen values
disp('Eigen values');
disp(val);

%taking two eigen vales 
%calculation of eigen vector follows
vec(:,1)=[];

%final dataset after principal component analysis
fds=std_dataset*vec;
disp('Final dataset after performing PCA');
disp(fds);
 figure('Name','Final Dataset');scatter(fds(:,1),fds(:,2),'.','r');xlabel('First Component');ylabel('Second Component');
 figure('Name','Raw_Data1');scatter(raw_data(:,1),raw_data(:,2),'.','r');xlabel('First variable');ylabel('Second variable');
 figure('Name','Raw_Data2');scatter(raw_data(:,2),raw_data(:,3),'.','r');xlabel('Second variable');ylabel('Third variable');
 figure('Name','Raw_Data3');scatter(raw_data(:,3),raw_data(:,1),'.','r');xlabel('Third variable');ylabel('First variable');
 figure('Name','Raw_Data_3D');scatter3(raw_data(:,1),raw_data(:,2),raw_data(:,3),'.','r');xlabel('First variable');ylabel('Second variable');zlabel('Third variable')

