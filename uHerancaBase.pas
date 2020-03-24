unit uHerancaBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, System.ImageList, Vcl.ImgList, JvExStdCtrls, JvButton, JvCtrls,
  uFuncoes;

type
  TfrmHerancaBase = class(TForm)
    pnlHeader: TPanel;
    pnlHeaderLineTop: TPanel;
    pnlHeaderLineLeft: TPanel;
    pnlHeaderLineRight: TPanel;
    pnlFormLineLeft: TPanel;
    pnlFormLineRight: TPanel;
    pnlFormLineBottom: TPanel;
    imgBtnClose: TImage;
    pnlHeaderLineGray: TPanel;
    lblTitulo: TLabel;
    imgButtons: TImageList;
    procedure imgBtnCloseClick(Sender: TObject);
    procedure pnlHeaderMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHerancaBase: TfrmHerancaBase;

implementation

{$R *.dfm}

procedure TfrmHerancaBase.FormShow(Sender: TObject);
begin
  if Self.Caption<>EmptyStr then
     lblTitulo.Caption:=Self.Caption;
end;

procedure TfrmHerancaBase.imgBtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmHerancaBase.pnlHeaderMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  if Button = mbleft then begin
     ReleaseCapture;
     self.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;

end;



end.
