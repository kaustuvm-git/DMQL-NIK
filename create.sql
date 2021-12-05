

--
-- Create Table Scripts Start

CREATE TABLE IF NOT EXISTS market (
                                    market_code VARCHAR(5) PRIMARY KEY, 
                                    country VARCHAR(50), 
                                    city VARCHAR(50), 
                                    region VARCHAR(50)
                                   );
                                   

CREATE TABLE IF NOT EXISTS company (
                                    symbol varchar(5) PRIMARY KEY,
                                    name VARCHAR(50),
                                    sector VARCHAR(30)
                                   );
                                   
                                   
CREATE TABLE IF NOT EXISTS company_detail (
                                            symbol VARCHAR(5),
                                            market_code VARCHAR(5),
                                            address VARCHAR(100),
                                            city VARCHAR(20),
                                            state VARCHAR(20),
                                            country VARCHAR(20),
                                            phone VARCHAR(15),
                                            summary bytea,
                                            PRIMARY KEY (symbol, market_code),
                                            FOREIGN KEY (symbol) REFERENCES company(symbol),
                                            FOREIGN KEY (market_code) REFERENCES market(market_code)
                                          );
                                          
                                          
CREATE TABLE IF NOT EXISTS stock_history (
                                           market_code VARCHAR(5),
                                           symbol VARCHAR(5),
                                           date DATE,
                                           open float8,
                                           high float8,
                                           low float8,
                                           close float8,
                                           volume float8,
                                           dividend float8,
                                           stock_split float8,
                                           PRIMARY KEY (symbol, market_code, date),
                                           FOREIGN KEY (symbol) REFERENCES company(symbol),
                                           FOREIGN KEY (market_code) REFERENCES market(market_code)
                                         );
                                         
CREATE TABLE IF NOT EXISTS stock_matrix (
                                          market_code VARCHAR(5),
                                          symbol VARCHAR(5),
                                          day_high float8,
                                          day_low float8,
                                          price float8,
                                          recommendation VARCHAR(5),
                                          PRIMARY KEY (symbol, market_code),
                                          FOREIGN KEY (symbol) REFERENCES company(symbol),
                                          FOREIGN KEY (market_code) REFERENCES market(market_code)
                                        );
--
-- Create Table Scripts End
--