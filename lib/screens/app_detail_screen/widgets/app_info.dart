import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:learn1/assets/assets.dart';
import 'package:learn1/extensions/context_extension.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({
    Key? key,
  }) : super(key: key);

  final String longText = "Welcome professionals! LinkedIn is the social network for job seekers, professionals, and businesses. Build your network, find business contacts, connect with recruiters, and use your professional profile as an online resume.\n\nLinkedIn’s job search filters help you narrow down from the millions of jobs posted to the job that’s right for you. Use job search alerts to get notified when new positions open up in companies you’re interested in, all the while connecting directly with recruiters or employees in your network. Tap into your network to ask for a referral for companies you’re applying to and get your resume noticed. You can also apply on-the-go to save time and be the first application to the job of your dreams.\n\nUse LinkedIn to navigate your career with confidence--whether you want to find a new job, keep in touch with your network, or stay up-to-date on the latest from your connections and your industry.\n\nWhy you’ll love using the LinkedIn app:\n1. Job search: Browse on-the-go and set job alerts so that you can be the first to apply\n2. Job apply: Apply easily to millions of jobs with your resume, right from the app\n3. Industry news: Stay on top of the latest news and conversations happening in your industry\n4. Chat with your network: Send messages and get alerted when your contacts reply\n5. Business networking: Use Find Nearby and QR code scanner features to easily find and connect to people you meet in the moment\n\nSOCIAL NETWORKING\n• Find friends, classmates, and colleagues to add to your network\n• See updates on their activity and reach out on the app to stay in touch\n• Share articles, comments, and knowledge with your network\n• Follow hashtags to get updates on topics you care about the most\n\nBUSINESS NETWORKING\n• Follow companies, influencers, and topics you’re interested in\n• Reach out to connections at companies you’re interested in for referrals and advice\n• Learn about what’s happening in your industry with curated content\n\nJOB SEARCH\n• Search and apply to millions of openings\n• Upload and easily submit your resume to jobs that fit\n• Save searches and create alerts to be the first to know about new openings\n\nCAREER FINDER PROFILE\n• Use your LinkedIn profile as a virtual resume\n• Highlight your accomplishments, responsibilities, and experience\n• Add a picture to help people you know and potential employers find you\n\nGET MORE OUT OF LINKEDIN BY USING THE APP\n• Find nearby: allows you to connect to people in your vicinity\n• QR code scanner: share your unique code so people can connect with you instantly\n• Push notifications: know immediately when someone responds or wants to connect\n\nWhether you want to build your professional reputation, find a new job, share your knowledge, or just need a lightweight way to stay in touch, LinkedIn is the professional social network for you.\n\nStart your job search with the LinkedIn app today.\nThe LinkedIn app is free to use and download.\n---------------------------\nWant to make the most of LinkedIn? Upgrade to a Premium subscription for exclusive tools to find a job, grow your business, find sales leads, or hire talent--priced from \$29.99 monthly to \$119.95 monthly.\nSubscriptions will automatically renew each month and be charged to your iTunes account within 24-hours of the end of the current period, unless auto-renew is turned off at least 24-hours before the end of the current period. You can turn off auto-renew at any time from your iTunes account settings, but refunds will not be provided for any unused portion of the term. These prices are for United States customers. Pricing in other countries may vary and actual charges may be converted to your local currency depending on the country of residence.\n\nPrivacy Policy: https://www.linkedin.com/legal/privacy-policy\n\nTerms of Service: https://www.linkedin.com/legal/user-agreement";


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Divider(height: 20, color: AppAssets.colors.grey, thickness: 1),
          const SizedBox(height: 10,),
          ExpandableText(
            longText,
            expandText: context.locale.showMore,
            collapseText: context.locale.showLess,
            maxLines: 3,
            linkColor: AppAssets.colors.blue,
            style: AppAssets.fontStyles.bodyWhite ,
          ),
        ],
      ),
    );
  }
}
