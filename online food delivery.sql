use practice;
create table online_food (Age int, Gender varchar(20), Marital_Status varchar(20), Occupation varchar(20), Monthly_Income int, Family_Size varchar(20), Pincode int, output varchar(20), Feedback varchar(50));

copy online_food (Age, Gender, Marital_Status, Occupation, Monthly_Income, Family_Size, Pincode, output, Feedback)
from 'C:\Users\shailesh shinde\OneDrive\Desktop\Digikull\online food.csv'
delimitor ','
csv header;

select * from online_food_data;
#Online food order decision based on customer Age

select Age_group,count(Age_group) as Number_of_customer from(
SELECT *,
       CASE
           WHEN Age < 18 THEN 'Child'
           WHEN Age BETWEEN 18 AND 25 THEN 'Young Adult'
           WHEN Age BETWEEN 26 AND 40 THEN 'Adult'
           WHEN Age BETWEEN 41 AND 60 THEN 'Middle-aged'
           ELSE 'Senior'
       END AS Age_Group
FROM online_food_data) as age_groups group by Age_group;

select * from online_food_data;

#Online food order decision based on size of the family


select family_personwise,count(family_size) as food_buyer
from (

select *,
		case 
			when family_size<2 then 'single'
            when family_size=2 then 'couple'
            else 'big_family'
         end as family_personwise
from online_food_data) as food_data group by family_size;


select gender,count(Gender) as total_order from online_food_data group by gender order by total_order desc;

select marital_status, count(marital_status) as total_order from online_food_data group by marital_status order by total_order desc;

select distinct monthly_income from online_food_data;
select monthly_income, count(monthly_income) as total_order from online_food_data group by monthly_income order by total_order desc;

select educational_qualifications, count(educational_qualifications) as total_order from online_food_data group by educational_qualifications order by total_order desc;

select occupation, count(occupation) as total_order from online_food_data group by occupation order by total_order desc;

select feedback, count(feedback) as total_order from online_food_data group by feedback order by total_order desc;

SELECT 
    monthly_income,
    COUNT( monthly_income) AS total_order,
    ROUND((COUNT( monthly_income) * 100.0) / SUM(COUNT( monthly_income)) OVER (), 2) AS percentage
FROM online_food_data
GROUP BY  monthly_income
ORDER BY total_order DESC;














