package com.fer.hr.onlinecatalogue.web.security.servlets;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jCharts.chartData.DataSeries;
import org.jCharts.test.TestDataGenerator;
import org.jCharts.properties.ClusteredBarChartProperties;
import org.jCharts.chartData.AxisChartDataSet;
import org.jCharts.properties.AxisProperties;
import org.jCharts.properties.ChartProperties;
import org.jCharts.properties.LegendProperties;
import org.jCharts.axisChart.AxisChart;
import org.jCharts.encoders.PNGEncoder;
import org.jCharts.types.ChartType;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.fer.hr.onlinecatalogue.catalog.dao.CatalogDAO;
import com.fer.hr.onlinecatalogue.catalog.entity.Catalog;

import java.awt.Paint;

@WebServlet(urlPatterns = { "/statistikeGraf" })
public class StatisticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OutputStream out = response.getOutputStream(); /* Get the output stream from the response object */
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"com/fer/hr/onlinecatalogue/web/security/servlets/config.xml");
		CatalogDAO catalogDao = (CatalogDAO) context.getBean("dao");
		String[] xAxisLabels1 = { "Kognitivne", "Motoričke", "Teškoće sluha", "Teškoće vida", "Višestruke" };
		String[] xAxisLabels2 = { "Edukacija", "Komunikacija", "Rehabilitacija", "Druge primjene" };
		String[] xAxisLabels3 = { "Spec.platforme", "Android", "Windows", "iOS", "Tizen", "Linux" };
		String[] xAxisLabels4 = { "Hrvatski", "Engleski" };
		String xAxisTitle = null;
		String yAxisTitle = null;
		String title = null;
		DataSeries dataSeries = null;
		double[][] data = null;
		Paint[] paints = null;
		String choice = request.getParameter("id");
		// add ID to url to do which function
		try {
			List<Catalog> listOfAll = catalogDao.getCatalogItems();
			// before this add id and based on that it will go in some of the choice
			if (choice.equals("prvi")) {
				int[] numberOfDisabilites = new int[5];
				numberOfDisabilites = getAllDisabilities(listOfAll);
				xAxisTitle = " "; /* X - Axis label */
				yAxisTitle = " "; /* Y-Axis label */
				title = "Broj digitalnih asistivnih rješenja za pojedinu vrstu teškoće"; /* Chart title */
				dataSeries = new DataSeries(xAxisLabels1, xAxisTitle, yAxisTitle, title); /* Define the dataseries */
				data = new double[][] { { numberOfDisabilites[0], numberOfDisabilites[1], numberOfDisabilites[2],
						numberOfDisabilites[3], numberOfDisabilites[4] } };
				paints = TestDataGenerator.getRandomPaints(1);
			} else if (choice.equals("drugi")) {

				int[] numberOfTypes = new int[4];
				numberOfTypes = getAllTypes(listOfAll);
				xAxisTitle = " "; /* X - Axis label */
				yAxisTitle = " "; /* Y-Axis label */
				title = "Broj digitalnih asistivnih rješenja za pojedinu vrstu primjene"; /* Chart title */
				dataSeries = new DataSeries(xAxisLabels2, xAxisTitle, yAxisTitle, title); /* Define the dataseries */
				data = new double[][] { { numberOfTypes[0], numberOfTypes[1], numberOfTypes[2], numberOfTypes[3] } };
				paints = TestDataGenerator.getRandomPaints(1);
			} else if (choice.equals("treci")) {
				int[] numberOfPlatforms = new int[6];
				numberOfPlatforms = getAllPlatforms(listOfAll);
				xAxisTitle = " "; /* X - Axis label */
				yAxisTitle = " "; /* Y-Axis label */
				title = "Broj digitalnih asistivnih rješenja za pojedinu platformu"; /* Chart title */
				dataSeries = new DataSeries(xAxisLabels3, xAxisTitle, yAxisTitle, title); /* Define the dataseries */
				data = new double[][] { { numberOfPlatforms[0], numberOfPlatforms[1], numberOfPlatforms[2],
						numberOfPlatforms[3], numberOfPlatforms[4], numberOfPlatforms[5] } };
				paints = TestDataGenerator.getRandomPaints(1);

			} else if (choice.equals("cetvrti")) {
				int[] numberOfLangs = new int[2];
				numberOfLangs = getAllLangs(listOfAll);
				xAxisTitle = " "; /* X - Axis label */
				yAxisTitle = " "; /* Y-Axis label */
				title = "Broj digitalnih asistivnih rješenja za pojedni jezik"; /* Chart title */
				dataSeries = new DataSeries(xAxisLabels4, xAxisTitle, yAxisTitle, title); /* Define the dataseries */

				/* Step - 2: Define the data for the clustered bar chart */
				data = new double[][] { { numberOfLangs[0], numberOfLangs[1] } };
				paints = TestDataGenerator.getRandomPaints(1);
			}
			ClusteredBarChartProperties clusteredBarChartProperties = new ClusteredBarChartProperties();
			String[] legendLabels = new String[1];
			if (choice.equals("prvi")) {
				legendLabels[0] = "Vrsta teškoće";
			} else if (choice.equals("drugi")) {
				legendLabels[0] = "Vrsta primjene";
			} else if (choice.equals("treci")) {
				legendLabels[0] = "Platforme";
			}else if(choice.equals("cetvrti")) {
				legendLabels[0] = "Jezici";
			}
			AxisChartDataSet axisChartDataSet = new AxisChartDataSet(data, legendLabels, paints,
					ChartType.BAR_CLUSTERED, clusteredBarChartProperties);
			dataSeries.addIAxisPlotDataSet(axisChartDataSet);

			/* Step -3 - Create the chart */
			ChartProperties chartProperties = new ChartProperties(); /* Special chart properties, if any */
			AxisProperties axis_Properties = new AxisProperties();
			LegendProperties legend_Properties = new LegendProperties(); /* Dummy Axis and legend properties class */
			AxisChart my_output_chart = new AxisChart(dataSeries, chartProperties, axis_Properties, legend_Properties,
					640, 480); /* Create Chart object */

			/* Step -3: Set the response type to PNG */
			response.setContentType("image/png"); /* Set the HTTP Response Type */

			/* Step -4: Write the chart output as PNG image file */
			PNGEncoder.encode(my_output_chart, out); /* This class creates the output PNG file for the chart */

		} catch (Exception e) {
			System.err.println(e.toString()); /* Throw exceptions to log files */
		} finally {
			out.close();/* Close the output stream */
		}
	}

	private int[] getAllLangs(List<Catalog> listOfAll) {
		int[] numOfLangs = new int[2];
		for (Catalog single : listOfAll) {
			if (single.getJezici().toLowerCase().contains("hrvatski")) {
				numOfLangs[0]++;
			}
			if (single.getJezici().toLowerCase().contains("engleski")) {
				numOfLangs[1]++;
			}
		}
		return numOfLangs;
	}

	private int[] getAllPlatforms(List<Catalog> listOfAll) {
		int[] numOfPlatforms = new int[6];
		for (Catalog single : listOfAll) {
			if (single.getPlatforma().contains("Specifične platforme")) {
				numOfPlatforms[0]++;
			}
			if (single.getPlatforma().toLowerCase().contains("android")) {
				numOfPlatforms[1]++;
			}
			if (single.getPlatforma().toLowerCase().contains("windows")) {
				numOfPlatforms[2]++;
			}
			if (single.getPlatforma().toLowerCase().contains("ios")) {
				numOfPlatforms[3]++;
			}
			if (single.getPlatforma().toLowerCase().contains("tizen")) {
				numOfPlatforms[4]++;
			}
			if (single.getPlatforma().toLowerCase().contains("linux")) {
				numOfPlatforms[5]++;
			}

		}
		return numOfPlatforms;
	}

	private int[] getAllTypes(List<Catalog> listOfAll) {
		int[] numOfTypes = new int[4];
		for (Catalog single : listOfAll) {
			if (single.getVrstaPrimjene().toLowerCase().contains("edukacija")) {
				numOfTypes[0]++;
			}
			if (single.getVrstaPrimjene().toLowerCase().contains("komunikacija")) {
				numOfTypes[1]++;
			}
			if (single.getVrstaPrimjene().toLowerCase().contains("rehabilitacija")) {
				numOfTypes[2]++;
			}
			if (single.getVrstaPrimjene().toLowerCase().contains("druge primjene")) {
				numOfTypes[3]++;
			}

		}
		return numOfTypes;
	}

	private int[] getAllDisabilities(List<Catalog> listOfAll) {
		int[] numOfDisabilities = new int[5];// index is same as in graph
		for (Catalog single : listOfAll) {
			if (single.getVrstaPoteskoce().startsWith("Kognitivne")) {
				numOfDisabilities[0]++;
			} else if (single.getVrstaPoteskoce().startsWith("Motoričke")) {
				numOfDisabilities[1]++;
			} else if (single.getVrstaPoteskoce().startsWith("Poteškoće sluha")) {
				numOfDisabilities[2]++;
			} else if (single.getVrstaPoteskoce().startsWith("Poteškoće vida")) {
				numOfDisabilities[3]++;
			} else if (single.getVrstaPoteskoce().startsWith("Višestruke")) {
				numOfDisabilities[4]++;
			}
		}
		return numOfDisabilities;
	}
}