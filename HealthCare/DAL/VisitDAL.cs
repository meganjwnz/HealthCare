﻿using HealthCare.DB;
using HealthCare.Model;
using System;
using System.Data.SqlClient;

namespace HealthCare.DAL
{
    /// <summary>
    /// Retrieves all the visit information from database
    /// </summary>
    class VisitDAL
    {
        #region VisitStatements
        private const string insertVisitStatement = "INSERT INTO visit([nurseID], [appointmentID], [weight], [systolicBP], [diastolicBP], [temp], [pulse], [symptoms], [status])" +
                        "VALUES(@nurseID,@apptID,@weight,@systolicBP,@diastolicBP,@temp,@pulse,@symptoms,@status); SELECT SCOPE_IDENTITY()";
        private const string insertDiagnosticStatement = "INSERT INTO diagnosis([visitID],[initialDiagnosis],[finalDiagnosis])" +
                        "VALUES(@visitID,@initial,@final)";
        private const string updateVisitStatement = "UPDATE visit SET [nurseID] = @nurseID, [appointmentID] = @apptID, [weight] = @weight, [systolicBP] = @systolicBP, [diastolicBP] = @diastolicBP" +
            ", [temp] = @temp ,[pulse] = 1 ,[symptoms] = @symptoms, [status] = @status " +
            "WHERE visitID = @visitID";
        private const string updateDiagnosticsStatement = "UPDATE diagnosis SET [visitID] = @visitID, [initialDiagnosis] = @initial, [finalDiagnosis] = @final WHERE visitID = @visitID";

        #endregion

        private const string selectStatement = "SELECT p.firstName + ' ' + p.lastName AS doctorName, v.status, a.patientID, a.doctorID, a.datetime, dg.initialDiagnosis, dg.finalDiagnosis, v.weight, v.systolicBP, v.diastolicBP, v.temp, v.pulse, v.symptoms, v.visitID, a.appointmentID " +
                "FROM Appointment AS a " +
                "LEFT JOIN Visit AS v ON v.appointmentID = a.appointmentID " +
                "JOIN Doctor AS d ON a.doctorID = d.doctorID " +
                "JOIN Person AS p ON d.personID = p.personID " +
                "LEFT JOIN Diagnosis AS dg ON v.visitID = dg.visitID " +
                "WHERE a.appointmentID = @apptID ";

        /// <summary>
        /// Gets a visit by the appointmentID
        /// </summary>
        /// <param name="apptID">appointmentID to search</param>
        /// <returns>Visit of that appointmentID</returns>
        public Visit GetVisitByAppt(int apptID)
        {
            Visit visit = new Visit();

            using (SqlConnection connection = HealthcareDBConnection.GetConnection())
            {
                connection.Open();

                using (SqlCommand selectCommand = new SqlCommand(selectStatement, connection))
                {
                    selectCommand.Parameters.AddWithValue("@apptID", apptID);
                    using (SqlDataReader reader = selectCommand.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            visit.VisitID = reader["visitID"] as int? ?? 0;
                            visit.AppointmentID = (int)reader["appointmentID"];
                            visit.Status = reader["status"] as int? ?? 0;
                            visit.PatientID = (int)reader["patientID"];
                            visit.DoctorName = (string)reader["doctorName"];
                            visit.DoctorID = (int)reader["doctorID"];
                            visit.DateTime = (DateTime)reader["dateTime"];
                            visit.Weight = reader["weight"] as decimal? ?? 0;
                            visit.Temp = reader["temp"] as decimal? ?? 0;
                            visit.SystolicBP = reader["systolicBP"] as int? ?? 0;
                            visit.DiastolicBP = reader["diastolicBP"] as int? ?? 0;
                            visit.Pulse = reader["pulse"] as int? ?? 0;
                            visit.Symptoms = reader["symptoms"] as string;
                            visit.InitialDiagnosis = reader["initialDiagnosis"] as string;
                            visit.FinalDiagnosis = reader["finalDiagnosis"] as string;
                        }

                    }
                }
            }
            return visit;
        }

        /// <summary>
        /// Adds or updates a visit
        /// </summary>
        /// <param name="visit">visit to add or update</param>
        /// <returns>True if visit is updated</returns>
        public bool AddOrUpdateVisit(Visit visit)
        {
            int visitResult = 0;
            int diagnosisResult = 0;

            if (visit.VisitID == 0)
            {
                //create new visit
                using (SqlConnection connection = HealthcareDBConnection.GetConnection())
                {
                    int pk = -1;
                    connection.Open();
                    SqlTransaction transaction = connection.BeginTransaction();
                    try
                    {
                        using (SqlCommand insertCommand = new SqlCommand(insertVisitStatement, connection))
                        {
                            insertCommand.Transaction = transaction;
                            insertCommand.Parameters.AddWithValue("@nurseID", visit.NurseID);
                            insertCommand.Parameters.AddWithValue("@apptID", visit.AppointmentID);
                            insertCommand.Parameters.AddWithValue("@weight", visit.Weight);
                            insertCommand.Parameters.AddWithValue("@systolicBP", visit.SystolicBP);
                            insertCommand.Parameters.AddWithValue("@diastolicBP", visit.DiastolicBP);
                            insertCommand.Parameters.AddWithValue("@pulse", visit.Pulse);
                            insertCommand.Parameters.AddWithValue("@temp", visit.Temp);
                            insertCommand.Parameters.AddWithValue("@symptoms", visit.Symptoms);
                            insertCommand.Parameters.AddWithValue("@status", visit.Status);


                            pk = Convert.ToInt32(insertCommand.ExecuteScalar());
                            visitResult = 1;
                        }
                        using (SqlCommand insertDiagnosisCommand = new SqlCommand(insertDiagnosticStatement, connection))
                        {
                            insertDiagnosisCommand.Transaction = transaction;
                            insertDiagnosisCommand.Parameters.AddWithValue("@visitID", pk);
                            insertDiagnosisCommand.Parameters.AddWithValue("@initial", visit.InitialDiagnosis);
                            insertDiagnosisCommand.Parameters.AddWithValue("@final", visit.FinalDiagnosis);

                            diagnosisResult = insertDiagnosisCommand.ExecuteNonQuery();
                        }

                        transaction.Commit();
                    }
                    catch
                    {
                        transaction.Rollback();
                    }
                }
            }
            else
            {
                //update visit and diagnostics
                using (SqlConnection connection = HealthcareDBConnection.GetConnection())
                {
                    connection.Open();
                    SqlTransaction transaction = connection.BeginTransaction();
                    try
                    {
                        using (SqlCommand updateVisitCommand = new SqlCommand(updateVisitStatement, connection))
                        {
                            updateVisitCommand.Transaction = transaction;
                            updateVisitCommand.Parameters.AddWithValue("@nurseID", visit.NurseID);
                            updateVisitCommand.Parameters.AddWithValue("@apptID", visit.AppointmentID);
                            updateVisitCommand.Parameters.AddWithValue("@weight", visit.Weight);
                            updateVisitCommand.Parameters.AddWithValue("@systolicBP", visit.SystolicBP);
                            updateVisitCommand.Parameters.AddWithValue("@diastolicBP", visit.DiastolicBP);
                            updateVisitCommand.Parameters.AddWithValue("@temp", visit.Temp);
                            updateVisitCommand.Parameters.AddWithValue("@pulse", visit.Pulse);
                            updateVisitCommand.Parameters.AddWithValue("@symptoms", visit.Symptoms);
                            updateVisitCommand.Parameters.AddWithValue("@visitID", visit.VisitID);
                            updateVisitCommand.Parameters.AddWithValue("@status", visit.Status);

                            visitResult = updateVisitCommand.ExecuteNonQuery();
                        }
                        using (SqlCommand updateDiagnositicsCommand = new SqlCommand(updateDiagnosticsStatement, connection))
                        {
                            updateDiagnositicsCommand.Transaction = transaction;
                            updateDiagnositicsCommand.Parameters.AddWithValue("@visitID", visit.VisitID);
                            updateDiagnositicsCommand.Parameters.AddWithValue("@initial", visit.InitialDiagnosis);
                            updateDiagnositicsCommand.Parameters.AddWithValue("@final", visit.FinalDiagnosis);

                            diagnosisResult = updateDiagnositicsCommand.ExecuteNonQuery();
                        }

                        transaction.Commit();
                    }
                    catch
                    {
                        transaction.Rollback();
                    }
                }

            }
            return (diagnosisResult == 1 && visitResult >= 1 ? true : false);
        }
    }
}
