-- Change Products table always to insert value 1 in price
-- column if no price is provided on insert
ALTER TABLE Products
ALTER COLUMN Price SET DEFAULT 1;

-- Change Products table to prevent inserting Price that will
-- more than 2x bigger then the cost price
ALTER TABLE Products
ADD CONSTRAINT Check_PriceCost
CHECK (Price <= CostPrice * 2);


-- Change Products table to guarantee unique names across
-- the products
ALTER TABLE Products
ADD CONSTRAINT unique_Product_Name
UNIQUE (Name);
