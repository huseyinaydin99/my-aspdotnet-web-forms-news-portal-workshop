using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Fonksiyon
/// </summary> .
public class Fonksiyon
{
	public Fonksiyon()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public SqlConnection baglan()
    {
        SqlConnection baglanti = new SqlConnection("Data Source=DESKTOP-13123BI;Initial Catalog=HaberPortali;Integrated Security=True");
        baglanti.Open();
        return (baglanti);
    }

    public int cmd(string sqlcumle)
    {
        SqlConnection baglan = this.baglan();
        SqlCommand sorgu = new SqlCommand(sqlcumle, baglan);
        int sonuc = 0;

        try
        {
            sonuc = sorgu.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            throw new Exception(ex.Message + " (" + sqlcumle + ")");
        }
        sorgu.Dispose();
        baglan.Close();
        baglan.Dispose();
        return (sonuc);
    }

    public DataTable GetDataTable(string sql)
    {
        SqlConnection baglanti = this.baglan();
        SqlDataAdapter adapter = new SqlDataAdapter(sql, baglanti);
        DataTable dt = new DataTable();
        try
        {
            adapter.Fill(dt);
        }
        catch (SqlException ex)
        {
            throw new Exception(ex.Message + " (" + sql + ")");
        }
        adapter.Dispose();
        baglanti.Close();
        baglanti.Dispose();
        return dt;
    }

    public DataSet GetDataSet(string sql)
    {
        SqlConnection baglanti = this.baglan();
        SqlDataAdapter adapter = new SqlDataAdapter(sql, baglanti);
        DataSet ds = new DataSet();
        try
        {
            adapter.Fill(ds);
        }
        catch (SqlException ex)
        {
            throw new Exception(ex.Message + " (" + sql + ")");
        }
        adapter.Dispose();
        baglanti.Close();
        baglanti.Dispose();
        return ds;
    }

    public DataRow GetDataRow(string sql)
    {
        DataTable table = GetDataTable(sql);
        if (table.Rows.Count == 0) return null;
        return table.Rows[0];
    }

    public string GetDataCell(string sql)
    {
        DataTable table = GetDataTable(sql);
        if (table.Rows.Count == 0) return null;
        return table.Rows[0][0].ToString();
    }
}