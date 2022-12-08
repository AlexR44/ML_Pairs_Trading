CREATE TABLE "exchange" (
    "id" SERIAL NOT NULL,
    "abbrev" varchar(32)   NOT NULL,
    "name" varchar(255)   NOT NULL,
    "city" varchar(255)   NOT NULL,
    "currency" varchar(64)   NOT NULL,
    "timezone_offset" time   NULL,
    "created_date" timestamp NOT NULL,
    "last_updated_date" timestamp    NOT NULL,
    CONSTRAINT "pk_exchange" PRIMARY KEY (
        "id"
     )
	);

CREATE TABLE "data_vendor" (
    "id" serial   NOT NULL,
    "name" varchar(64)   NOT NULL,
    "website_url" varchar(255)   NOT NULL,
    "support_email" varchar(255)   NOT NULL,
    "created_date" timestamp   NOT NULL,
    "last_updated_date" timestamp   NOT NULL,
    CONSTRAINT "pk_data_vendor" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "symbol" (
    "id" serial   NOT NULL,
    "exchange_id" int   NULL,
    "ticker" varchar(32)   NOT NULL,
    "instrument" varchar(64)   NOT NULL,
    "name" varchar(255)   NULL,
    "sector" varchar(255)   NULL,
    "currency" varchar(32)   NULL,
    "created_date" TIMESTAMP   NOT NULL,
    "last_updated_date" TIMESTAMP   NOT NULL,
    CONSTRAINT "pk_symbol" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "daily_price" (
    "id" serial   NOT NULL,
    "data_vendor_id" int   NOT NULL,
    "symbol_id" int   NOT NULL,
    "price_date" timestamp   NOT NULL,
    "created_date" timestamp   NOT NULL,
    "last_updated_date" timestamp   NOT NULL,
    "open_price" decimal(19,4)   NULL,
    "high_price" decimal(19,4)   NULL,
    "low_price" decimal(19,4)   NULL,
    "close_price" decimal(19,4)   NULL,
    "adj_close_price" decimal(19,4)   NULL,
    "volume" bigint   NULL,
    CONSTRAINT "pk_daily_price" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "symbol" ADD CONSTRAINT "fk_symbol_exchange_id" FOREIGN KEY("exchange_id")
REFERENCES "exchange" ("id");

ALTER TABLE "daily_price" ADD CONSTRAINT "fk_daily_price_data_vendor_id" FOREIGN KEY("data_vendor_id")
REFERENCES "data_vendor" ("id");

ALTER TABLE "daily_price" ADD CONSTRAINT "fk_daily_price_symbol_id" FOREIGN KEY("symbol_id")
REFERENCES "symbol" ("id");