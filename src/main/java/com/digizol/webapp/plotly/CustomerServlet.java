package com.digizol.webapp.plotly;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CustomerServlet extends HttpServlet {

    private List<Customer> customers = new ArrayList<Customer>();

    public CustomerServlet() {
        initCustomersList();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("customersList",
                getCustomers(resultSize(request.getParameter("size"))));
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    private int resultSize(String sizeParam) {
        return sizeParam==null?customers.size():Integer.parseInt(sizeParam);
    }

    private List<Customer> getCustomers(int size) {
        return customers.subList(0, size);
    }

    private void initCustomersList() {
        customers.add(new Customer("cust-1", 25, 17));
        customers.add(new Customer("cust-2", 36, 99));
        customers.add(new Customer("cust-3", 17, 0));
        customers.add(new Customer("cust-4", 58, 10));
        customers.add(new Customer("cust-5", 49, 32));
        customers.add(new Customer("cust-6", 80, 14));
        customers.add(new Customer("cust-7", 31, 78));
        customers.add(new Customer("cust-8", 22, 89));
        customers.add(new Customer("cust-9", 43, 21));
        customers.add(new Customer("cust-10", 74, 45));
    }

}
