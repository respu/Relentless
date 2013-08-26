using MySql.Data.MySqlClient;
using Relentless.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Text;
using System.Threading;

namespace Relentless.Database
{
    public class DB
    {
        public static MySQLHandler Database = new MySQLHandler();
    }

    public class MySQLHandler
    {
        public int rowCount;
        public int lastId;
        public static string connectionString = "Server=" + ConfigReader.mysqlHost + ";User Id=" + ConfigReader.mysqlUsername + ";Port=" + ConfigReader.mysqlPort + ";" +
                                                "Password=" + ConfigReader.mysqlPassword + ";Database=" + ConfigReader.mysqlDatabase + ";Allow Zero Datetime=True;" +
                                                "Pooling=False;CharSet=utf8";

        public void Connect(MySqlConnection connection)
        {
            try
            {
                connection.Open();
                Console.WriteLine("Connection to MySQL database was successful");
            }
            catch
            {
                Console.WriteLine("Connection failed to MySQL database! Reconnecting in 5 seconds...");

                Thread.Sleep(5000);
                Connect(connection);
            }
        }

        public bool Execute(MySqlConnection connection, bool openConnection, bool closeConnection, string sql, params object[] args)
        {
            if (openConnection == true)
            {
                connection.Open();
            }

            StringBuilder sqlString = new StringBuilder();
            sqlString.AppendFormat(CultureInfo.GetCultureInfo("en-US").NumberFormat, sql);

            try
            {
                using (MySqlCommand sqlCommand = new MySqlCommand(sqlString.ToString(), connection))
                {
                    var mParams = new List<MySqlParameter>(args.Length);

                    foreach (var a in args)
                    {
                        mParams.Add(new MySqlParameter("", a));
                    }

                    sqlCommand.Parameters.AddRange(mParams.ToArray());
                    sqlCommand.ExecuteNonQuery();

                    lastId = (int)sqlCommand.LastInsertedId;
                }

                return true;
            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex.Message);

                return false;
            }
            finally
            {
                if (closeConnection == true)
                {
                    connection.Close();
                }
            }
        }

        public SQLResult Select(MySqlConnection connection, bool openConnection, bool closeConnection, string sql, params object[] args)
        {
            if (openConnection == true)
            {
                connection.Open();
            }

            StringBuilder sqlString = new StringBuilder();
            sqlString.AppendFormat(CultureInfo.GetCultureInfo("en-US").NumberFormat, sql);

            try
            {
                using (var sqlCommand = new MySqlCommand(sqlString.ToString(), connection))
                {
                    var mParams = new List<MySqlParameter>(args.Length);

                    foreach (var a in args)
                    {
                        mParams.Add(new MySqlParameter("", a));
                    }

                    sqlCommand.Parameters.AddRange(mParams.ToArray());

                    using (var SqlData = sqlCommand.ExecuteReader(CommandBehavior.Default))
                    {
                        using (var retData = new SQLResult())
                        {
                            retData.Load(SqlData);
                            retData.Count = retData.Rows.Count;

                            return retData;
                        }
                    }
                }
            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                if (closeConnection == true)
                {
                    connection.Close();
                }
            }

            return null;
        }
    }
}
