using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for StudentMaster
/// </summary>
public class clsStudentMaster
{
    string constring = ConfigurationManager.ConnectionStrings["CRUD"].ConnectionString;

    #region StudentMaster
    public int StudentID { get; set; }
    public string Name { get; set; }
    public string MobileNo { get; set; }
    public string EmailID { get; set; }
    public DateTime DOB { get; set; }
    public string RollNo { get; set; }
    public string Address { get; set; }
    public int UserID { get; set; }
    #endregion

    #region StudentSubject
    public int StudentSubjectID { get; set; }
    public int SubjectID { get; set; }
    #endregion

    public int InsertUpdateStudentMaster(clsStudentMaster obj)
    {
        SqlConnection con = new SqlConnection(constring);

        SqlCommand cmd = new SqlCommand("InsertUpdateStudentMaster", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@StudentID", obj.StudentID);
        cmd.Parameters.AddWithValue("@Name", obj.Name);
        cmd.Parameters.AddWithValue("@MobileNo", obj.MobileNo);
        cmd.Parameters.AddWithValue("@EmailID", obj.EmailID);
        cmd.Parameters.AddWithValue("@DOB", obj.DOB);
        cmd.Parameters.AddWithValue("@RollNo", obj.RollNo);
        cmd.Parameters.AddWithValue("@Address", obj.Address);
        cmd.Parameters.AddWithValue("@UserID", obj.UserID);
        con.Open();
        StudentID = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();

        return StudentID;
    }

    public int DeleteStudentMaster(clsStudentMaster obj)
    {
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand("DeleteStudentMaster", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@StudentID", obj.StudentID);
        cmd.Parameters.AddWithValue("@UserID", obj.UserID);
        con.Open();
        int count = cmd.ExecuteNonQuery();
        con.Close();
        return count;
    }

    public DataTable SelectStudentMaster(int StudentID)
    {
        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand("SelectStudentMaster", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@StudentID", StudentID);
        con.Open();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        sda.Fill(dt);
        return dt;
    }

    public int DeleteStudentSubject(int StudentID)
    {
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand("DeleteStudentSubject", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@StudentID", StudentID);
        con.Open();
        int count = cmd.ExecuteNonQuery();
        con.Close();
        return count;
    }

    public int InsertStudentSubject(clsStudentMaster obj)
    {
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand("insertStudentSubject", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@StudentID", obj.StudentID);
        cmd.Parameters.AddWithValue("@SubjectID", obj.SubjectID);
        con.Open();
        int count = cmd.ExecuteNonQuery();
        con.Close();
        return count;
    }

    public DataTable SelectSubjectList()
    {
        SqlConnection con = new SqlConnection(constring);
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand("SelectSubjectList", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        con.Open();
        sda.Fill(dt);
        con.Close();
        return dt;
    }

    public DataTable SelectStudentSubjectList(int StudentID)
    {
        SqlConnection con = new SqlConnection(constring);
        SqlCommand cmd = new SqlCommand("SelectStudentSubjectList", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@StudentID", StudentID);
        DataTable dt = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        con.Open();
        sda.Fill(dt);
        con.Close();
        return dt;
    }
}