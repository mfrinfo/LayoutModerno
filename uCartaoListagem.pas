unit uCartaoListagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uHerancaListagem, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, JvExStdCtrls, JvButton,
  JvCtrls, Vcl.Mask, Vcl.Imaging.pngimage, Vcl.ExtCtrls, uEnum;

type
  TfrmCartaoListagem = class(TfrmHerancaListagem)
    QryListagemcartaoId: TIntegerField;
    QryListagemdescricaoCartao: TWideStringField;
    procedure bntModificarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
  private
    procedure AbrirCadastro(estadoCadastro: TEstadoDoCadastro);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCartaoListagem: TfrmCartaoListagem;

implementation

{$R *.dfm}

uses uCartaoCadastro;

procedure TfrmCartaoListagem.AbrirCadastro(estadoCadastro:TEstadoDoCadastro);
begin
  try
    frmCartaoCadastro := TfrmCartaoCadastro.Create(Self);
    frmCartaoCadastro.EstadoDoCadastro:=estadoCadastro;
    case estadoCadastro of
      ecNovo: begin
        frmCartaoCadastro.qryCadastro.ParamByName('cartaoId').AsInteger:=-1;
        frmCartaoCadastro.qryCadastro.Open;
        frmCartaoCadastro.qryCadastro.Append;
      end;
      ecModificar: begin
        frmCartaoCadastro.qryCadastro.ParamByName('cartaoId').AsInteger:=QryListagem.FieldByName('cartaoId').AsInteger;
        frmCartaoCadastro.qryCadastro.Open;
        frmCartaoCadastro.qryCadastro.Edit;
      end;
      ecApagar: begin
        frmCartaoCadastro.qryCadastro.ParamByName('cartaoId').AsInteger:=QryListagem.FieldByName('cartaoId').AsInteger;
        frmCartaoCadastro.qryCadastro.Open;
        frmCartaoCadastro.HabilitaDesabilitaTela(false);
      end;
    end;

    frmCartaoCadastro.ShowModal;
  finally
    frmCartaoCadastro.Release;
    Self.RefreshQuery(qryListagem);
  end;
end;

procedure TfrmCartaoListagem.bntModificarClick(Sender: TObject);
begin
  inherited;
  AbrirCadastro(ecModificar);
end;

procedure TfrmCartaoListagem.btnApagarClick(Sender: TObject);
begin
  inherited;
  AbrirCadastro(ecApagar);
end;

procedure TfrmCartaoListagem.btnNovoClick(Sender: TObject);
begin
  inherited;
  AbrirCadastro(ecNovo);
end;

initialization
   RegisterClass(TfrmCartaoListagem);

end.
