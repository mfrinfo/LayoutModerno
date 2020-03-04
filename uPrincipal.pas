unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    pnlPrincipalLeft: TPanel;
    BitBtn1: TBitBtn;
    pnlPrincipalCenter: TPanel;
    pnlPrincipalCenterLeft: TPanel;
    pnlPrincipalCenterRight: TPanel;
    pnlPrincipalCenterTop: TPanel;
    pnlPrincipalCenterBottom: TPanel;
    pgcPrincipal: TPageControl;
    tbsMenu: TTabSheet;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uSplash, uHerancaBase, uHerancaListagem, uFuncoes;

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  {
  frmHerancaListagem:= TfrmHerancaListagem.Create(Self);
  frmHerancaListagem.ShowModal;
  frmHerancaListagem.Release;
  }

  CriarAba(TfrmHerancaListagem, pgcPrincipal, -1);

end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  frmSplash:=TfrmSplash.Create(Self);
  frmSplash.Show;
  frmSplash.Refresh;
  Sleep(3000);


  if Assigned(frmSplash) then
     frmSplash.Free;
end;

end.
