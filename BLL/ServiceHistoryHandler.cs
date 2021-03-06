﻿using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ServiceHistoryHandler
    {
        ServiceHistoryDBAccess serviceHistoryDB = null;
        public ServiceHistoryHandler()
        {
            serviceHistoryDB = new ServiceHistoryDBAccess();
        }
        public bool AddNew(ServiceHistory objServiceHistory)
        {
            return serviceHistoryDB.AddNew(objServiceHistory);
        }
        public List<ServiceHistory> GetServiceHistoryForLastNRecords()
        {
            return serviceHistoryDB.GetServiceHistoryForLastNRecords();
        }
        public List<ServiceHistory> GetAllServiceHistory()
        {
            return serviceHistoryDB.GetServiceHistoryList();
        }
        public List<ServiceHistory> StatusOfNRecords()
        {
            return serviceHistoryDB.GetServiceHistoryStatusOfNRecords();
        }
    }
}
