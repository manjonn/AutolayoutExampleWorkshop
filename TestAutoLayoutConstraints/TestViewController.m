//
//  TestViewController.m
//  TestAutoLayoutConstraints
//
//  Created by Manjula Jonnalagadda on 2/11/14.
//  Copyright (c) 2014 Manjula Jonnalagadda. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

-(void)loadView{
    
    [super loadView];
    
    UILabel *headerLabel=[UILabel new];
    headerLabel.translatesAutoresizingMaskIntoConstraints=NO;
    headerLabel.text=@"Words of the wise";
    headerLabel.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:headerLabel];
    
    UISegmentedControl *segmentedControl=[[UISegmentedControl alloc]initWithItems:@[@"Feeling Wise",@"In Need of wisdom"]];
    segmentedControl.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:segmentedControl];
    
    UIButton *addWisdomBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    addWisdomBtn.backgroundColor=[UIColor redColor];
    addWisdomBtn.translatesAutoresizingMaskIntoConstraints=NO;
    [addWisdomBtn setTitle:@"Add Wisdom" forState:UIControlStateNormal];
    [self.view addSubview:addWisdomBtn];
    
    UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:tableView];
    
    UIView *btnView=[UIView new];
    btnView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:btnView];
    
    UIButton *shareBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    shareBtn.translatesAutoresizingMaskIntoConstraints=NO;
    [shareBtn setTitle:@"Share Wisdom" forState:UIControlStateNormal];
    [btnView addSubview:shareBtn];
 
    UIButton *updateBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    updateBtn.translatesAutoresizingMaskIntoConstraints=NO;
    [updateBtn setTitle:@"Update Wisdom" forState:UIControlStateNormal];
    [btnView addSubview:updateBtn];

    NSArray *btnViewHorConstraints=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[shareBtn(==updateBtn)][updateBtn]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(updateBtn,shareBtn)];
    
    NSArray *shareBtnVerConstraints=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[shareBtn]|" options:0 metrics:nil views:@{@"shareBtn": shareBtn}];
 
    NSArray *updateBtnVerConstraints=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[updateBtn]|" options:0 metrics:nil views:@{@"updateBtn": updateBtn}];

    [btnView addConstraints:btnViewHorConstraints];
    [btnView addConstraints:shareBtnVerConstraints];
    [btnView addConstraints:updateBtnVerConstraints];
    
    NSArray *verConstraints=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[headerLabel(40)][segmentedControl][addWisdomBtn][tableView][btnView(40)]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(headerLabel,segmentedControl,addWisdomBtn,tableView,btnView)];
    
    
    
    NSArray *horConstraints=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[headerLabel]-|" options:0 metrics:nil views:@{@"headerLabel": headerLabel}];
    
    NSArray *segHorConstraints=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[segmentedControl]-|" options:0 metrics:nil views:@{@"segmentedControl": segmentedControl}];

    NSArray *btnHorConstraints=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[addWisdomBtn]-|" options:0 metrics:nil views:@{@"addWisdomBtn": addWisdomBtn}];

    NSArray *tableHorConstraints=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[tableView]-|" options:0 metrics:nil views:@{@"tableView": tableView}];

    NSArray *btnVwHorConstraints=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[btnView]-|" options:0 metrics:nil views:@{@"btnView": btnView}];

    [self.view addConstraints:verConstraints];
    [self.view addConstraints:horConstraints];
    [self.view addConstraints:segHorConstraints];
    [self.view addConstraints:btnHorConstraints];
    [self.view addConstraints:tableHorConstraints];
    [self.view addConstraints:btnVwHorConstraints];
    
    
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
