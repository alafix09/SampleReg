//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
USEFORM("TruckEditFormUnit.cpp", TruckEditForm);
USEFORM("TrucksFormUnit.cpp", TrucksForm);
USEFORM("DtModule.cpp", DataModule1); /* TDataModule: File Type */
USEFORM("PwdFormUnit.cpp", PwdForm);
USEFORM("SampleEditFormUnit.cpp", SampleEditForm);
USEFORM("UploadFormUnit.cpp", UploadForm);
//---------------------------------------------------------------------------
#include "PwdFormUnit.h"


int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
	try
	{
		Application->Initialize();




		Application->CreateForm(__classid(TDataModule1), &DataModule1);
		Application->CreateForm(__classid(TTrucksForm), &TrucksForm);
		Application->Run();
	}
	catch (Exception &exception)
	{
		Application->ShowException(&exception);
	}
	catch (...)
	{
		try
		{
			throw Exception("");
		}
		catch (Exception &exception)
		{
			Application->ShowException(&exception);
		}
	}
	return 0;
}
//---------------------------------------------------------------------------
