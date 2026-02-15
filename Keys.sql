# Create key for table phones
ALTER TABLE phones
MODIFY phone_id VARCHAR(10) NOT NULL;   # MySQL cannot create an index or primary key on a TEXT/BLOB column unless we specify a prefix length. Change to VARCHAR(10)
ALTER TABLE phones
ADD PRIMARY KEY (phone_id);

DESCRIBE phones;

# Create key for table regions
ALTER TABLE regions
MODIFY region_id VARCHAR(10) NOT NULL;
ALTER TABLE regions
ADD PRIMARY KEY (region_id);

DESCRIBE regions;

# Create key for table sales
ALTER TABLE sales
MODIFY sale_id VARCHAR(10) NOT NULL;
ALTER TABLE sales
ADD PRIMARY KEY (sale_id);

ALTER TABLE sales
MODIFY phone_id VARCHAR(10) NULL;                             # Must match phones.phone_id type
ALTER TABLE sales
ADD FOREIGN KEY (phone_id) REFERENCES phones(phone_id);

ALTER TABLE sales
MODIFY region_id VARCHAR(10) NULL;                             # Must match regions.region_id type
ALTER TABLE sales
ADD FOREIGN KEY (region_id) REFERENCES regions(region_id);

DESCRIBE sales;