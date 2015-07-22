drop table PhoneInfo;

create table PhoneInfo(
	name varchar2(20) not null,
	birthdate date not null,
	gender number not null,
	phone varchar2(20) not null
)


insert into PhoneInfo values('성훈', '1988-02-17', 1, '010-3449-0171');
insert into PhoneInfo values('승후', '1998-12-08', 1, '010-2911-0171');
insert into PhoneInfo values('미영', '1986-09-01', 2, '010-3352-0171');
insert into PhoneInfo values('하루', '1988-02-17', 2, '010-8257-0171');

insert into PhoneInfo values('민우', '1996-06-22', 1, '010-1183-7283');
insert into PhoneInfo values('민수', '1998-08-03', 1, '010-4734-8634');
insert into PhoneInfo values('나영', '1988-02-17', 2, '010-9353-4582');
insert into PhoneInfo values('수지', '2000-11-28', 2, '010-4833-7422');

select * from PHONEINFO;

drop table EmMember;

create table EmMember(
	emId varchar2(40) primary key,
	emPassword varchar2(30) not null,
	emPhone varchar2(20) not null,
	emName varchar2(20) not null,
	emBirthdate date not null,
	emGender number not null
)

insert into EmMember values('ttt@choongang.com', '123', '010-8257-0171', '하루', '1988-02-17', 2);
insert into EmMember values('123@choongang.com', '123', '010-1183-7283', '민우', '1996-06-22', 1);
insert into EmMember values('aaa@choongang.com', '123', '010-4734-8634', '민수', '1998-08-03', 1);
insert into EmMember values('bbb@choongang.com', '123', '010-9353-4582', '나영', '1988-02-17', 2);
insert into EmMember values('ccc@choongang.com', '123', '010-4833-7422', '수지', '2000-11-28', 2);

select * from EMMEMBER;

delete EmMember where emname = '성훈';

drop table EmMember;



create table EmAddrBook(
	emId varchar2(40) references EmMember(emId),
	emAddrBook varchar2(40) not null,
	emAddrName varchar2(20) not null,
	emBolckChk number
)

insert into EMADDRBOOK values('ttt@choongang.com', '123@choongang.com', '민우', 0);
insert into EMADDRBOOK values('ttt@choongang.com', 'ccc@choongang.com', '수지', 0);

select * from EMADDRBOOK;

drop table EmAddrBook;

create table EmEmail(
	emNo number,
	emSendAddr varchar2(40),
	emGetAddr varchar2(40),
	emSendDate date,
	emTitle varchar2(60) not null,
	emContent varchar2(2000),
	emReadChk number,
	emsendDelChk number,
	emgetDelChk number
)

insert into EmEmail values(1, 'ccc@choongang.com', 'ttt@choongang.com', sysdate, '테스트입니다', '테스트 내용이라고 아놔', 0, 0, 0);
insert into EmEmail values(2, 'aaa@choongang.com', 'ttt@choongang.com', sysdate, '내용 잘 보이는가', '테스트입니다', 0, 0, 0);
insert into EmEmail values(3, '123@choongang.com', 'ttt@choongang.com', sysdate, '테스트2', '테스트 내용', 0, 0, 0);

select * from EmEmail;
drop table EmEmail;