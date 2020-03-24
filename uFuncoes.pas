unit uFuncoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Data.DB, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  System.ImageList, Vcl.ImgList, Vcl.DBCtrls, Vcl.ComCtrls, JvCtrls;

  procedure CriarAba(aForm: TFormClass; aPageControl:TPageControl; aIndexImagem: Integer);
  function AbaExiste(aNomeAba:string; aPageControl:TPageControl): Boolean;
  procedure FecharAba(aNomeAba:string; aPageControl:TPageControl);
  procedure ButtonMouseEnter(Sender: TObject; ImageIndex:Integer);
  procedure ButtonMouseLeave(Sender: TObject; ImageIndex:Integer);

implementation

procedure CriarAba(aForm: TFormClass; aPageControl:TPageControl; aIndexImagem: Integer);
var TabSheet: TTabSheet;
    Form: TForm;
begin

  Form := aForm.Create(nil);

  if AbaExiste(Form.Caption, aPageControl) then begin
    if Assigned(Form) then
       FreeAndNil(Form);
    exit;
  end;

  TabSheet:=TTabSheet.Create(nil);
  TabSheet.PageControl := aPageControl;
  TabSheet.Caption:= Form.Caption;
  TabSheet.ImageIndex:=aIndexImagem;

  Form.Align:=alClient;
  Form.BorderStyle:=bsNone;
  Form.Parent := TabSheet;
  Form.Show;

  aPageControl.ActivePage := TabSheet;

end;

function AbaExiste(aNomeAba:string; aPageControl:TPageControl): Boolean;
var I: Integer;
begin
  Result:=false;
  for I := 0 to aPageControl.PageCount -1 do begin
    if LowerCase(aPageControl.Pages[I].Caption) = LowerCase(aNomeAba) then begin
      aPageControl.ActivePage:=aPageControl.Pages[I];
      aPageControl.TabIndex:=I;
      Result:=true;
      Break;
    end;
  end;
end;

procedure FecharAba(aNomeAba:string; aPageControl:TPageControl);
var I: Integer;
begin
  for I := 0 to aPageControl.PageCount -1 do begin
    if LowerCase(aPageControl.Pages[I].Caption) = LowerCase(aNomeAba) then begin
      aPageControl.Pages[I].Destroy;
      aPageControl.ActivePageIndex:=0;
      Break;
    end;
  end;
end;

procedure ButtonMouseEnter(Sender: TObject; ImageIndex:Integer);
begin
  (Sender as TJvImgBtn).ImageIndex:=ImageIndex;
  (Sender as TJvImgBtn).Cursor:=crHandPoint;
end;

procedure ButtonMouseLeave(Sender: TObject; ImageIndex:Integer);
begin
  (Sender as TJvImgBtn).ImageIndex:=ImageIndex;
  (Sender as TJvImgBtn).Cursor:=crDefault;
end;

end.
