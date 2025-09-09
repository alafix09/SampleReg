//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DtModule.h"
#include "UploadFormUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TUploadForm *UploadForm;
//---------------------------------------------------------------------------
__fastcall TUploadForm::TUploadForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------


void __fastcall TUploadForm::OKButtonClick(TObject *Sender)
{
	if (SIDEdit->Text != NULL && SIDEdit->Text != "")
	{
		DataModule1->saveFile(StrToInt(SIDEdit->Text));
	}
}
//---------------------------------------------------------------------------

