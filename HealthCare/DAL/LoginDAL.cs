﻿using HealthCare.DB;
using HealthCare.Model;
using System;
using System.Data;
using System.Data.SqlClient;

namespace HealthCare.DAL
{
    /// <summary>
    /// The Login Data Access Layer
    /// </summary>
    public class LoginDAL
    {
        /// <summary>
        /// retireve a person's login information
        /// </summary>
        /// <param name="username">As a string</param>
        /// <param name="password">As a string</param>
        /// <returns></returns>
        public DataTable GetLogin(string username, string password)
        {
            HashingService hashing = new HashingService();
            DataTable dt = new DataTable();
            string selectStatement = "SELECT l.personID, l.userName, l.password, (p.firstName + ' ' + p.lastName) AS name" +
                " FROM login l JOIN person p ON p.personID = l.personID WHERE userName = @username AND password = @password";

            using (SqlConnection connection = HealthcareDBConnection.GetConnection())
            {
                connection.Open();
                SqlCommand sc = new SqlCommand(selectStatement, connection);
                sc.Parameters.AddWithValue("@username", username);
                sc.Parameters.AddWithValue("@password", hashing.PasswordHashing(password));
                SqlDataReader reader = sc.ExecuteReader();


                dt.Columns.Add("personID", typeof(int));
                dt.Columns.Add("userName", typeof(string));
                dt.Columns.Add("password", typeof(string));
                dt.Columns.Add("name", typeof(string));


                dt.Load(reader);

            }

            return dt;
        }

        /// <summary>
        /// return true if user is a nurse
        /// </summary>
        /// <param name="personID">As an integer</param>
        /// <returns>true if user is a nurse</returns>
        public Boolean IsNurse(int personID)
        {
            DataTable dt = new DataTable();
            Boolean isNurse = false;
            string selectStatement = "SELECT CASE WHEN EXISTS(SELECT * FROM nurse n WHERE n.personID = p.personID)" +
                " THEN 'is nurse' ELSE 'not nurse' END FROM person p WHERE p.personID = @personID";

            using (SqlConnection connection = HealthcareDBConnection.GetConnection())
            {
                connection.Open();

                SqlCommand sc = new SqlCommand(selectStatement, connection);
                sc.Parameters.AddWithValue("@personID", personID);

                using (SqlDataReader reader = sc.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (reader.GetValue(0).ToString() == "is nurse")
                        {
                            isNurse = true;
                        }
                    }
                }

                return isNurse;

            }
        }

        /// <summary>
        /// Add a login to the system
        /// </summary>
        /// <param name="login">A login object</param>
        public void AddLogin(Login login)
        {
            SqlConnection connection = HealthcareDBConnection.GetConnection();
            string insertStatement =
                "INSERT Login " +
                  "(personID, userName, password) " +
                "VALUES (@personID, @userName, @password)";
            SqlCommand insertCommand = new SqlCommand(insertStatement, connection);
            insertCommand.Parameters.AddWithValue("@personID", login.PersonID);
            insertCommand.Parameters.AddWithValue("@userName", login.UserName);
            insertCommand.Parameters.AddWithValue("@password", login.Password);

            connection.Open();
            insertCommand.ExecuteNonQuery();
            string selectStatement = "SELECT IDENT_CURRENT('Login') FROM Login";
            SqlCommand selectCommand = new SqlCommand(selectStatement, connection);
        }

    }
}
