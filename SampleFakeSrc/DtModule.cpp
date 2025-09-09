//---------------------------------------------------------------------------

#include <fstream>
#pragma hdrstop
#include "PwdFormUnit.h"
#include "DtModule.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma classgroup "Vcl.Controls.TControl"
#pragma resource "*.dfm"
TDataModule1 *DataModule1;
//---------------------------------------------------------------------------

std::string exportPath;


__fastcall TDataModule1::TDataModule1(TComponent* Owner)
	: TDataModule(Owner)
{
	TPwdForm *pwdForm;


//	pwdForm = new TPwdForm(this);
//	if (pwdForm->ShowModal() != mrOk)
//	{
//		exit(0);
//	}




}
//---------------------------------------------------------------------------
