﻿--Bài 1
--Nhập vào MaNV cho biết tuổi của nhân viên này
create function FN_Age(@MaNV nvarchar(9))
returns int 
as
begin
return(
select DATEDIFF(year,NGSINH,GETDATE())+1 from NHANVIEN where MANV= @MaNV);
end;

 select [dbo].[FN_Age]('006');

 --Nhập vào Manv cho biết số lượng đề án nhân viên này đã tham gia
--họ tên nhân viên (HONV, TENLOT, TENNV) có mức lương trên mức lương trung bình
--của phòng đó.
--và số lượng đề án mà phòng ban đó chủ trì.
SELECT TOP (1000) [HONV]
      ,[TENNV]
      ,[TENPHG]
      ,[DIADIEM]
  FROM [QLDA].[dbo].[ThonTinNV PHONG]
      ,[LUONG]
      ,[Tuoi]
  FROM [QLDA].[dbo].[NHANVIEN LUONG TUOI]
as
select a. TENPHG, 
b. HONV +' '+ b.TENLOT +'' + b.TENNV as 'TenTruongPhong'
 from PHONGBAN a inner join NHANVIEN b on a. TRPHG = b.MANV 
where a .MAPHG in (
select PHG from NHANVIEN
 group by phg
 having count(manv) =
 (select top 1 count(manv) as NVCount from NHANVIEN
group by phg
 order by NVCount desc)
 )

 SELECT TOP (1000) [TENPHG]
      ,[TenTruongPhong]
  FROM [QLDA].[dbo].[PhongBanDongNhat]

