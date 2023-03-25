/*User table*/
CREATE TABLE USER_TABLE 
(
  USER_ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 NOT NULL 
, USERNAME VARCHAR2(30 BYTE) NOT NULL 
, ROLE VARCHAR2(20 BYTE) NOT NULL 
, FIRST_NAME VARCHAR2(20 BYTE) NOT NULL 
, LAST_NAME VARCHAR2(20 BYTE) NOT NULL 
, CONSTRAINT TABLE1_PK PRIMARY KEY 
  (
    USER_ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX TABLE1_PK ON USER_TABLE (USER_ID ASC) 
      LOGGING 
      TABLESPACE DATA 
      PCTFREE 10 
      INITRANS 20 
      STORAGE 
      ( 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
);

alter table USER_TABLE
modify USER_ID generated always as identity restart start with 1;

/*address table.*/
CREATE TABLE ADDRESS 
(
  ADD_ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 CACHE 20 NOT NULL 
, STREET VARCHAR2(60 BYTE) NOT NULL 
, STATE VARCHAR2(20 BYTE) NOT NULL 
, ZIPCODE NUMBER NOT NULL 
, STATUS VARCHAR2(20 BYTE) NOT NULL 
, ACTOR_ID NUMBER NOT NULL 
, CONSTRAINT ADDRESS_PK PRIMARY KEY 
  (
    ADD_ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX ADDRESS_PK ON ADDRESS (ADD_ID ASC) 
      LOGGING 
      TABLESPACE DATA 
      PCTFREE 10 
      INITRANS 20 
      STORAGE 
      ( 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
);

ALTER TABLE ADDRESS
ADD CONSTRAINT ADDRESS_FK1 FOREIGN KEY
(
  ACTOR_ID 
)
REFERENCES USER_TABLE
(
  USER_ID 
)
ENABLE;

alter table ADDRESS
modify ADD_ID generated always as identity restart start with 1;

/*Requisition header table.*/
CREATE TABLE REQUISITION_HEADER 
(
  REQ_ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 NOT NULL 
, REQ_APPROVER_ID NUMBER NOT NULL 
, REQ_CREATOR_ID NUMBER NOT NULL 
, REQ_STATUS VARCHAR2(20) NOT NULL 
, REQ_DESC VARCHAR2(200) NOT NULL 
, APPROVAL_DATE DATE NOT NULL 
, BUDGET_CHECK VARCHAR2(20) NOT NULL 
, REQ_CREATED DATE NOT NULL  
, CONSTRAINT REQ_HDR_PK PRIMARY KEY 
  (
    REQ_ID 
  )
  ENABLE 
);

ALTER TABLE REQUISITION_HEADER
ADD CONSTRAINT REQ_HDR_FK2 FOREIGN KEY
(
  REQ_APPROVER_ID 
)
REFERENCES USER_TABLE
(
  USER_ID 
)
ENABLE;

ALTER TABLE REQUISITION_HEADER
ADD CONSTRAINT REQ_HDR_FK3 FOREIGN KEY
(
  REQ_CREATOR_ID 
)
REFERENCES USER_TABLE
(
  USER_ID 
)
ENABLE;

alter table REQUISITION_HEADER
modify REQ_ID generated always as identity restart start with 1;

/*Requisition Line Table.*/
CREATE TABLE REQUISITION_LINE 
(
  REQ_LINE_NO NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 NOT NULL 
, REQ_ID NUMBER NOT NULL 
, ITEM_VENDOR_ID NUMBER NOT NULL 
, QUANTITY NUMBER NOT NULL 
, CONSTRAINT REQ_LINE_PK PRIMARY KEY 
  (
    REQ_LINE_NO 
  )
  ENABLE 
);

ALTER TABLE REQUISITION_LINE
ADD CONSTRAINT REQ_LINE_FK1 FOREIGN KEY
(
  REQ_ID 
)
REFERENCES REQUISITION_HDR
(
  REQ_ID 
)
ENABLE;

alter table REQUISITION_LINE
modify REQ_LINE_NO generated always as identity restart start with 1;

/*Contact table.*/
CREATE TABLE CONTACT 
(
  CONT_ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 NOT NULL 
, PHONE_NO NUMBER NOT NULL 
, EMAIL VARCHAR2(30) NOT NULL 
, STATUS VARCHAR2(20) NOT NULL 
, ACTOR_ID NUMBER NOT NULL 
, CONSTRAINT CONTACT_PK PRIMARY KEY 
  (
    CONT_ID 
  )
  ENABLE 
);

ALTER TABLE CONTACT
ADD CONSTRAINT CONTACT_FK1 FOREIGN KEY
(
  ACTOR_ID 
)
REFERENCES USER_TABLE
(
  USER_ID 
)
ENABLE;

alter table CONTACT
modify CONT_ID generated always as identity restart start with 1;

/* Purchase Order Table */
CREATE TABLE PURCHASE_ORDER_HEADER 
(
  PO_ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 CACHE 20 NOT NULL 
, REQ_ID NUMBER NOT NULL 
, VENDOR_ID NUMBER NOT NULL 
, PO_DATE DATE NOT NULL 
, PO_STATUS VARCHAR2(20 BYTE) NOT NULL 
, PO_TOTAL NUMBER NOT NULL 
, CONSTRAINT PURCHASE_ORDER_HEADER_PK PRIMARY KEY 
  (
    PO_ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX PURCHASE_ORDER_HEADER_PK ON PURCHASE_ORDER_HEADER (PO_ID ASC) 
      LOGGING 
      TABLESPACE DATA 
      PCTFREE 10 
      INITRANS 20 
      STORAGE 
      ( 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
);

ALTER TABLE PURCHASE_ORDER_HEADER
ADD CONSTRAINT PURCHASE_ORDER_HEADER_FK1 FOREIGN KEY
(
  VENDOR_ID 
)
REFERENCES VENDOR
(
  VENDOR_ID 
)
ENABLE;

ALTER TABLE PURCHASE_ORDER_HEADER
ADD CONSTRAINT PURCHASE_ORDER_HEADER_FK2 FOREIGN KEY
(
  REQ_ID 
)
REFERENCES REQUISITION_HEADER
(
  REQ_ID 
)
ENABLE;

alter table PURCHASE_ORDER_HEADER
modify PO_ID generated always as identity restart start with 1;

/* Purchase Order Line */
CREATE TABLE PURCHASE_ORDER_LINE 
(
  PO_LINE_NO NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 NOT NULL 
, PO_ID NUMBER NOT NULL 
, REQ_LINE_NO NUMBER NOT NULL 
, CONSTRAINT PURCHASE_ORDER_LINE_PK PRIMARY KEY 
  (
    PO_LINE_NO 
  )
  ENABLE 
);

ALTER TABLE PURCHASE_ORDER_LINE
ADD CONSTRAINT PURCHASE_ORDER_LINE_FK1 FOREIGN KEY
(
  PO_ID 
)
REFERENCES PURCHASE_ORDER_HEADER
(
  PO_ID 
)
ENABLE;

ALTER TABLE PURCHASE_ORDER_LINE
ADD CONSTRAINT PURCHASE_ORDER_LINE_FK2 FOREIGN KEY
(
  REQ_LINE_NO 
)
REFERENCES REQUISITION_LINE
(
  REQ_LINE_NO 
)
ENABLE;

alter table PURCHASE_ORDER_LINE
modify PO_LINE_NO generated always as identity restart start with 1;

/* Item Table */
CREATE TABLE ITEM 
(
  ITEM_ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 NOT NULL 
, CATEGORY_NAME VARCHAR2(20) NOT NULL 
, ITEM_NAME VARCHAR2(20) NOT NULL 
, ITEM_DESC VARCHAR2(30) NOT NULL 
, CONSTRAINT ITEM_PK PRIMARY KEY 
  (
    ITEM_ID 
  )
  ENABLE 
);

alter table ITEM
modify ITEM_ID generated always as identity restart start with 1;

/* Vendor Table */
CREATE TABLE VENDOR 
(
  VENDOR_ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 NOT NULL 
, VENDOR_NAME VARCHAR2(20) NOT NULL 
, ACC_NUM NUMBER NOT NULL 
, STATUS CHAR NOT NULL 
, PAYMENT_METHOD VARCHAR2(20) NOT NULL 
, USER_ID NUMBER NOT NULL 
, CURRENCY VARCHAR2(20) NOT NULL 
, CONSTRAINT VENDOR_PK PRIMARY KEY 
  (
    VENDOR_ID 
  )
  ENABLE 
);

ALTER TABLE VENDOR
ADD CONSTRAINT VENDOR_FK1 FOREIGN KEY
(
  USER_ID 
)
REFERENCES USER_TABLE
(
  USER_ID 
)
ENABLE;

alter table VENDOR
modify VENDOR_ID generated always as identity restart start with 1;

/* Item Vendor Table */
CREATE TABLE ITEM_VENDOR 
(
  ITEM_VENDOR_ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 NOT NULL 
, ITEM_ID NUMBER NOT NULL 
, VENDOR_ID NUMBER NOT NULL 
, PRICE NUMBER NOT NULL 
, MINIMUM_ORDER NUMBER NOT NULL 
, CREATED_DATE DATE NOT NULL 
, UPDATED_DATE DATE NOT NULL 
, CONSTRAINT ITEM_VENDOR_PK PRIMARY KEY 
  (
    ITEM_VENDOR_ID 
  )
  ENABLE 
);

ALTER TABLE ITEM_VENDOR
ADD CONSTRAINT ITEM_VENDOR_FK1 FOREIGN KEY
(
  ITEM_ID 
)
REFERENCES ITEM
(
  ITEM_ID 
)
ENABLE;

ALTER TABLE ITEM_VENDOR
ADD CONSTRAINT ITEM_VENDOR_FK2 FOREIGN KEY
(
  VENDOR_ID 
)
REFERENCES VENDOR
(
  VENDOR_ID 
)
ENABLE;

alter table ITEM_VENDOR
modify ITEM_VENDOR_ID generated always as identity restart start with 1;

/* Invoice */
CREATE TABLE INVOICE 
(
  INVOICE_ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 NOT NULL 
, PO_ID NUMBER NOT NULL 
, GROSS_AMT NUMBER NOT NULL 
, CREATED_DATE DATE NOT NULL 
, CONSTRAINT INVOICE_PK PRIMARY KEY 
  (
    INVOICE_ID 
  )
  ENABLE 
);

ALTER TABLE INVOICE
ADD CONSTRAINT INVOICE_FK1 FOREIGN KEY
(
  PO_ID 
)
REFERENCES PURCHASE_ORDER_HEADER
(
  PO_ID 
)
ENABLE;

alter table INVOICE
modify INVOICE_ID generated always as identity restart start with 1;

/* Voucher */
CREATE TABLE VOUCHER 
(
  VOUCHER_ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 NOT NULL 
, INVOICE_ID NUMBER NOT NULL 
, VENDOR_ID NUMBER NOT NULL 
, INVOICE_DATE DATE NOT NULL 
, STATUS VARCHAR2(20) NOT NULL 
, GROSS_AMT NUMBER NOT NULL 
, ACCOUNTING_DATE DATE NOT NULL 
, CONSTRAINT VOUCHER_PK PRIMARY KEY 
  (
    VOUCHER_ID 
  )
  ENABLE 
);

ALTER TABLE VOUCHER
ADD CONSTRAINT VOUCHER_FK1 FOREIGN KEY
(
  VENDOR_ID 
)
REFERENCES VENDOR
(
  VENDOR_ID 
)
ENABLE;

ALTER TABLE VOUCHER
ADD CONSTRAINT VOUCHER_FK2 FOREIGN KEY
(
  INVOICE_ID 
)
REFERENCES INVOCE
(
  INVOICE_ID 
)
ENABLE;

alter table VOUCHER
modify VOUCHER_ID generated always as identity restart start with 1;

/* Journal Header */
CREATE TABLE JOURNAL_HEADER 
(
  JRNL_ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 NOT NULL 
, JRNL_DATE DATE NOT NULL 
, FISCAL_YEAR NUMBER NOT NULL 
, ACCOUNTING_PERIOD NUMBER NOT NULL 
, STATUS VARCHAR2(20) 
, CONSTRAINT JOURNAL_HEADER_PK PRIMARY KEY 
  (
    JRNL_ID 
  )
  ENABLE 
);

alter table JOURNAL_HEADER
modify JRNL_ID generated always as identity restart start with 1;

/* Journal Line */
CREATE TABLE JOURNAL_LINE 
(
  JRNL_LINE_NO NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 NOT NULL 
, JRNL_ID NUMBER NOT NULL 
, ACCOUNT_ID NUMBER NOT NULL 
, AMOUNT NUMBER NOT NULL 
, DESCRIPTION VARCHAR2(60) NOT NULL 
, TRANSACTION_FLAG VARCHAR2(20) NOT NULL 
, CONSTRAINT JOURNAL_LINE_PK PRIMARY KEY 
  (
    JRNL_LINE_NO 
  )
  ENABLE 
);

ALTER TABLE JOURNAL_LINE
ADD CONSTRAINT JOURNAL_LINE_FK1 FOREIGN KEY
(
  JRNL_ID 
)
REFERENCES JOURNAL_HEADER
(
  JRNL_ID 
)
ENABLE;

ALTER TABLE JOURNAL_LINE
ADD CONSTRAINT JOURNAL_LINE_FK1 FOREIGN KEY
(
  ACCOUNT_ID 
)
REFERENCES ACCOUNT
(
  ACCOUNT_ID 
)
ENABLE;

ALTER TABLE JOURNAL_LINE
ADD CONSTRAINT JOURNAL_LINE_FK2 FOREIGN KEY
(
  ACCOUNT_ID 
)
REFERENCES ACCOUNT
(
  ACCOUNT_ID 
)
ENABLE;

ALTER TABLE JOURNAL_LINE  
MODIFY (DESCRIPTION VARCHAR2(100 BYTE) );

alter table JOURNAL_LINE
modify JRNL_LINE_NO generated always as identity restart start with 1;

/* Account Table */
CREATE TABLE ACCOUNT 
(
  ACCOUNT_ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 NOT NULL 
, ACCOUNT_NAME VARCHAR2(40) NOT NULL 
, ACCOUNT_TYPE VARCHAR2(20) NOT NULL 
, CONSTRAINT ACCOUNT_PK PRIMARY KEY 
  (
    ACCOUNT_ID 
  )
  ENABLE 
);

ALTER TABLE ACCOUNT MODIFY (ACCOUNT_ID DROP IDENTITY);

alter table ACCOUNT
modify ACCOUNT_ID generated always as identity restart start with 1;

/* Ledger Table */
CREATE TABLE LEDGER 
(
  LEDGER_ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 NOT NULL 
, JRNL_ID NUMBER NOT NULL 
, JRNL_LINE_NO NUMBER NOT NULL 
, ACCOUNT_ID NUMBER NOT NULL 
, ACCOUNTING_DATE DATE NOT NULL 
, TRANSACTION_FLAG NUMBER NOT NULL 
, AMOUNT NUMBER NOT NULL 
, CONSTRAINT LEDGER_PK PRIMARY KEY 
  (
    LEDGER_ID 
  )
  ENABLE 
);

ALTER TABLE LEDGER
ADD CONSTRAINT LEDGER_FK1 FOREIGN KEY
(
  JRNL_ID 
)
REFERENCES JOURNAL_HEADER
(
  JRNL_ID 
)
ENABLE;

ALTER TABLE LEDGER
ADD CONSTRAINT LEDGER_FK2 FOREIGN KEY
(
  JRNL_LINE_NO 
)
REFERENCES JOURNAL_LINE
(
  JRNL_LINE_NO 
)
ENABLE;

ALTER TABLE LEDGER
ADD CONSTRAINT LEDGER_FK3 FOREIGN KEY
(
  ACCOUNT_ID 
)
REFERENCES ACCOUNT
(
  ACCOUNT_ID 
)
ENABLE;

ALTER TABLE LEDGER
ADD CONSTRAINT LEDGER_FK3 FOREIGN KEY
(
  ACCOUNT_ID 
)
REFERENCES ACCOUNT
(
  ACCOUNT_ID 
)
ENABLE;

ALTER TABLE LEDGER  
MODIFY (TRANSACTION_FLAG VARCHAR2(20) );

alter table LEDGER
modify LEDGER_ID generated always as identity restart start with 1;


