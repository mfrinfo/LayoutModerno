unit uHerancaListagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uHerancaBase, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Data.DB, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  JvExStdCtrls, JvButton, JvCtrls, System.ImageList, Vcl.ImgList, Vcl.DBCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TfrmHerancaListagem = class(TfrmHerancaBase)
    pnlFormPrincipal: TPanel;
    pnlFormPrincipalTop: TPanel;
    pnlFormPrincipalBottom: TPanel;
    grdListagem: TDBGrid;
    pnlLineBottom: TPanel;
    pnlLineTop: TPanel;
    mskPesquisar: TMaskEdit;
    lblPesquisarPor: TLabel;
    btnNovo: TJvImgBtn;
    bntModificar: TJvImgBtn;
    btnApagar: TJvImgBtn;
    DBNavigator1: TDBNavigator;
    btnFechar: TJvImgBtn;
    QryListagem: TZQuery;
    DtsListagem: TDataSource;
    procedure btnNovoMouseEnter(Sender: TObject);
    procedure btnNovoMouseLeave(Sender: TObject);
    procedure bntModificarMouseEnter(Sender: TObject);
    procedure btnApagarMouseEnter(Sender: TObject);
    procedure btnFecharMouseEnter(Sender: TObject);
    procedure bntModificarMouseLeave(Sender: TObject);
    procedure btnApagarMouseLeave(Sender: TObject);
    procedure btnFecharMouseLeave(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure grdListagemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure mskPesquisarChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
    sIndexFieldNames:String;
    sNomeColunaDisplay:String;
    iColunaIndexada:integer;
    procedure MudarCorGridIndice;
  public
    { Public declarations }
    procedure RefreshQuery(aQry: TZQuery);
  end;

var
  frmHerancaListagem: TfrmHerancaListagem;

implementation

{$R *.dfm}

uses uFuncoes, uPrincipal, uDtmConexao;


procedure TfrmHerancaListagem.MudarCorGridIndice;
var
  I: Integer;
  index:string;
begin

  if qryListagem.IndexFieldNames=EmptyStr then begin
    qryListagem.IndexFieldNames:= sIndexFieldNames;
  end;

  index := qryListagem.IndexFieldNames;
  index := StringReplace(index, ' Asc', '', [rfReplaceAll]);
  index := StringReplace(index, ' Desc', '', [rfReplaceAll]);

  for I := 0 to grdListagem.Columns.Count - 1 do
  begin
    if UpperCase(grdListagem.Columns[i].FieldName) = UpperCase(trim(index)) then
    begin
      grdListagem.Columns[i].Color := clBtnFace;
      grdListagem.Columns[i].Title.Font.Color := clBlack;
      grdListagem.Columns[i].Title.Color := clInfoBk;
      lblPesquisarPor.Caption:='Pesquisar por '+grdListagem.Columns[i].Title.Caption;
      sNomeColunaDisplay:=grdListagem.Columns[i].FieldName;
      iColunaIndexada:=i;
    end
    else
    begin
      grdListagem.Columns[i].Color := clWhite;
      grdListagem.Columns[i].Title.Font.Color := clBlack;
      grdListagem.Columns[i].Title.Color := clBtnFace;
    end;
  end;
end;


procedure TfrmHerancaListagem.bntModificarMouseEnter(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 2);
end;

procedure TfrmHerancaListagem.bntModificarMouseLeave(Sender: TObject);
begin
  inherited;
  ButtonMouseLeave(Sender, 3);
end;

procedure TfrmHerancaListagem.btnApagarMouseEnter(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 8);
end;

procedure TfrmHerancaListagem.btnApagarMouseLeave(Sender: TObject);
begin
  inherited;
  ButtonMouseLeave(Sender, 9);
end;

procedure TfrmHerancaListagem.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmHerancaListagem.btnFecharMouseEnter(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 10);
end;

procedure TfrmHerancaListagem.btnFecharMouseLeave(Sender: TObject);
begin
  inherited;
  ButtonMouseLeave(Sender, 11);
end;

procedure TfrmHerancaListagem.btnNovoClick(Sender: TObject);
begin
  inherited;
  RefreshQuery(QryListagem);


end;

procedure TfrmHerancaListagem.btnNovoMouseEnter(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 0);
end;

procedure TfrmHerancaListagem.btnNovoMouseLeave(Sender: TObject);
begin
  inherited;
  ButtonMouseLeave(Sender, 1);
end;

procedure TfrmHerancaListagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FecharAba(Self.Caption,frmPrincipal.pgcPrincipal);
end;

procedure TfrmHerancaListagem.FormShow(Sender: TObject);
begin

  if (QryListagem.SQL.Text=EmptyStr) then begin
     MessageDlg('Não existe Instrução SQL no Componente',mtWarning,[mbOK],0);
     abort;
  end;

  inherited;

  sIndexFieldNames:=qryListagem.IndexFieldNames;

  QryListagem.Open;
  MudarCorGridIndice;

end;

procedure TfrmHerancaListagem.grdListagemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

   //Bloqueia o CTRL + DEL
   if (Shift = [ssCtrl]) and (Key = 46) then
      Key := 0;

end;

procedure TfrmHerancaListagem.grdListagemTitleClick(Column: TColumn);
Var i:Integer;
begin
  inherited;

  iColunaIndexada:=Column.Index;
  qryListagem.IndexFieldNames:=Column.FieldName;
  lblPesquisarPor.Caption:= 'Pesquisar por '+Column.Title.Caption;
  sNomeColunaDisplay:=Column.FieldName;

  for i := 0 to grdListagem.Columns.Count - 1 do
    Begin
      if grdListagem.Columns[i]=Column then  begin
        Column.Color:=clBtnFace;
        Column.Title.Color:=clBtnFace;
        Column.Title.Font.Color:=clBlack;
      end
      else begin
        grdListagem.Columns[i].Color:=clWhite;
        grdListagem.Columns[i].Title.Font.Color:=clBlack;
        grdListagem.Columns[i].Title.Color:=clBtnFace;
      end;
    End;

end;

procedure TfrmHerancaListagem.mskPesquisarChange(Sender: TObject);
begin
  inherited;
  if not qryListagem.IsEmpty then
     qryListagem.Locate(sNomeColunaDisplay, TMaskEdit(Sender).text, [loCaseInsensitive,loPartialKey])

end;

procedure TfrmHerancaListagem.RefreshQuery(aQry: TZQuery);
//var aBookMark:TBookmark;
begin
  try
    aQry.DisableControls;
    //aBookMark:=aQry.Bookmark;
    aQry.Refresh;
  finally
    //aQry.GotoBookmark(aBookMark);
    aQry.EnableControls;
    //aQry.FreeBookmark(aBookMark);
  end;
end;

end.
